    <!--Cabecera Administrador-->
    <?php include_once("librerias/cabeceraAdmin.php") ?>
        
        <div class="container" style="margin-top: 25px;">
            <div class="row">
                <!--Herramientas web-->
                <div class="col-xs-12 col">
                    <section>
                        <div class="panel panel-default">                            
                            <div class="panel-heading">
                                <h3 class="panel-title text-center text-capitalize">Lotes</h3>
                            </div>
                            <div id="mensajeHerramientas"></div>
                            <div class="panel-body">
                                <div class="form-group text-right">
                                    <span class="glyphicon glyphicon-collapse-down" id="muestraFormulario"></span>
                                </div>                                
                                <form style="display: none;" id="formHerramientas">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="txt_lote" placeholder="Lote">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="txt_medicamento" placeholder="Medicamento">
                                        <select name="" id=""class="form-control" placeholder="Medicamento"></select>
                                    </div>
                                    <div class="form-group">
                                        <input type="date" class="form-control" id="txt_caducidad" placeholder="Caducidad">
                                    </div>                                    
                                    <div class="form-group">
                                        <input type="hidden" value="0" id="txt_idHerramientaWeb">
                                        <button class="btn btn-success" type="button" id="guardarHerramienta">Guardar</button>
                                    </div>
                                </form>
                                <hr>
                                <div class="table-responsive">
                                    <table class="table table-condensed">
                                       <thead>
                                           <tr>
                                               <th class="text-capitalize text-center">#</th>
                                               <th class="text-capitalize text-center">Lote</th>
                                               <th class="text-capitalize text-center">SKU</th>
                                               <th class="text-capitalize text-center">Medicamento</th>
                                               <th class="text-capitalize text-center">Caducidad</th>
                                               <th class="text-capitalize text-center">Existencia</th>
                                               <th class="text-capitalize text-center">Salidas</th>
                                               <th class="text-capitalize text-center">Saldo</th>
                                           </tr>
                                       </thead>
                                       <tbody id="muestraHerramientas"></tbody>
                                   </table>
                               </div>
                            </div>
                        </div>
                    </section>
                </div>                
            </div>
        </div>

        <!-- Ventana Modal para agregar usuarios -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title text-center" id="myModalLabel"></h4>
                    </div>
                    <div class="modal-body">                        
                        <form>
                            <div class="form-group">
                                <input type="tetx" class="form-control" id="txt_Lote" disabled>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="txt_Medicamento" disabled>
                                </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="txt_Caducidad" disabled>
                            </div>
                            <div class="form-group">
                                <input type="number" min="1" class="form-control" id="txt_Cantidad" placeholder="Ingresa una cantidad">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">                                        
                        <button type="button" class="btn btn-info" id="guardarEntrada">Guardar</button>
                        <button type="button" class="btn btn-warning" id="guardarSalida">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
    
    <!--Pie Adminsitrador-->
    <?php include_once("librerias/pieAdministrador.php") ?>