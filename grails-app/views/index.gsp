<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Buy Gas</title>

    <style>
    .selected {
        background-color: #1ba23c;
        color: #ffffff;
    }
    </style>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-6" style="max-height: 500px; overflow: auto">
            <table id="table-gaseras" class="table table-responsive table-bordered">
                <thead>
                <tr>
                    <th>Location</th>
                    <th>Magna</th>
                    <th>Premium</th>
                </tr>
                </thead>
                <tbody id="body"></tbody>
            </table>
        </div>

        <div class="col-6">
            <div class="card">
                <div class="card-header">
                    Buy Gas
                </div>

                <div class="card-body">
                    <form class="row g-3 form-compra" name="form-compra" id="form-compra">
                        <div class="col-md-4">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" required class="form-control" id="email" name="email"
                                   placeholder="juan@gamil.com">
                        </div>

                        <div class="col-4">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" required class="form-control" name="name" id="name" placeholder="Juan">
                        </div>

                        <div class="col-4">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" required class="form-control" id="lastName" name="lastName"
                                   placeholder="Perez">
                        </div>

                        <div class="col-md-4">
                            <label for="cardNumber" class="form-label">Card Number</label>
                            <input type="text" required class="form-control onlyNumbers" name="cardNumber"
                                   id="cardNumber" maxlength="16" minlength="16">
                        </div>

                        <div class="col-md-4">
                            <label for="year" class="form-label">Year Expiration</label>
                            <input type="text" class="form-control onlyNumbers" required name="expirationDateYear"
                                   id="year"
                                   placeholder="2021" minlength="4" maxlength="4">
                        </div>

                        <div class="col-md-4">
                            <label for="inputState" class="form-label">Month Expiration</label>
                            <select id="inputState" name="expirationDateMonth" class="form-select">
                                <option value="1">01</option>
                                <option value="2">02</option>
                                <option value="3">03</option>
                                <option value="4">04</option>
                                <option value="5">05</option>
                                <option value="6">06</option>
                                <option value="7">07</option>
                                <option value="8">08</option>
                                <option value="9">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label for="gasType" class="form-label">Gas Type</label>
                            <select id="gasType" name="gasType" class="form-select">
                                <option value="1">Magna</option>
                                <option value="2">Premium</option>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label for="litros" class="form-label">Litros</label>
                            <input type="number" required class="form-control onlyNumbers" value="0" name="litros"
                                   id="litros"
                                   min="1">
                        </div>

                        <div class="col-md-4">
                            <label for="sellerName" class="form-label">Seller Name</label>
                            <input type="text" class="form-control" required name="sellerName" id="sellerName"
                                   placeholder="">
                        </div>

                        <div class="col-md-4">
                            <label for="sellerName" class="form-label">Amount</label>
                            <input type="hidden" class="form-control" required name="amount" id="amount" min="1">
                            <input type="hidden" class="form-control" required name="gasStation" id="gasStation">
                            <label id="amountLabel">$0.0</label>
                        </div>

                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Enviar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>




<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<script>
    $('.onlyNumbers').on('input', function () {
        this.value = this.value.replace(/[^0-9]/g, '');
    });

    $("table").on("click", "tbody tr", function () {
        $(".selected").removeClass("selected")
        $(this).closest("tr").addClass("selected");
        changeAmount();
    });

    $("#year").on("blur",function (){
        let anio = $(this).val();
        if (anio.length !== 4){
            alert("Year expiration min size min acepted 4");
        }
    });

    $("#litros").on("change", function () {
        changeAmount();
    });

    $("#gasType").on("change", function () {
        changeAmount();
    });

    $(function () {
        getGasolineras();
        $("#year").attr("min", anio);
    });

    function getGasolineras(pagina = 1) {
        let url = "https://api.datos.gob.mx/v1/precio.gasolina.publico"
        $.get(url, {page: pagina}, function (resp) {
            let data = resp?.results;
            let $tBody = $("#body");
            $.each(data, function () {
                let html = "<tr style='cursor: pointer' data-regular='" + this.regular + "' data-premium='" + this.premium + "' data-id='" + this._id + "'>" +
                    "<td>" + this.calle + ' ' + this.colonia + "</td>" +
                    "<td>$" + this.regular + "</td>" +
                    "<td>$" + this.premium + "</td>" +
                    "</tr>"
                $tBody.append(html);
            });
        });
    }

    function filtroTabla(idTabla, valor) {
        $.each($("#" + idTabla + " tbody tr"), function () {
            if ($(this).text().toLowerCase().indexOf($(valor).val().toLowerCase()) === -1)
                $(this).hide();
            else
                $(this).show();
        });
    }

    function changeAmount() {
        let litros = $("#litros").val();
        let type = $("#gasType").val();
        let gaseraData = $(".selected");
        if (gaseraData.length > 0) {
            let data = gaseraData.data();
            $("#gasStation").val(data.id);
            if (type === "1") {
                if (data.regular !== '') {
                    let costoLitro = data.regular;
                    let amount = (parseInt(litros) * parseFloat(costoLitro));
                    $("#amountLabel").text("$" + amount);
                    $("#amount").val(trunc(amount, 2)).removeAttr("min");
                } else {
                    alert("Magna no disponible")
                    $("#amount").val(0).attr("min", parseFloat(data.premium));
                    $("#amountLabel").text("$" + 0.0);
                }
            } else {
                if (data.premium !== '') {
                    let costoLitro = data.premium;
                    let amount = (parseInt(litros) * parseFloat(costoLitro))
                    $("#amountLabel").text("$" + amount);
                    $("#amount").val(trunc(amount, 2)).removeAttr("min");
                } else {
                    alert("Premium no disponible")
                    $("#amount").val(0).attr("min", parseFloat(data.premium));
                    $("#amountLabel").text("$" + 0.0);
                }
            }
        } else
            alert("Please choice a gasera")
    }

    $(document).on("submit", ".form-compra", function (e) {
        e.preventDefault();
        e.stopPropagation();
        let url = "${g.createLink(controller: 'infoRQ', action: "save")}"
        let form = $(this);
        let serialize = form.serializeArray();
        console.log("serialize ", serialize);
        $.post(url, serialize, function (response) {
            console.log("response ", response)
            alert(response.message)
            $("#form-compra")[0].reset();
            $(".selected").removeClass("selected")
        })
    })

    function trunc(x, posiciones = 0) {
        var s = x.toString()
        var l = s.length
        var decimalLength = s.indexOf('.') + 1
        var numStr = s.substr(0, decimalLength + posiciones)
        return Number(numStr)
    }

    function anio() {
        return new Date().getFullYear();
    }
</script>

</body>
</html>