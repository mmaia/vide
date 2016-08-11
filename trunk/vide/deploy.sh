echo *** Removendo pacote do Jboos
echo
echo
cd /home/herivelto/workspace/jboss-4.2.3.GA/server/pronto/deploy
rm -R apoema.war
echo
echo
echo *** Copiando novo pacote para o Jboos
echo
cd /home/herivelto/workspace/apoema/target
cp pronto-agile-1.0.0.war /home/herivelto/workspace/jboss-4.2.3.GA/server/pronto/deploy/apoema.war
echo
echo *** Deploy Finalizado 
