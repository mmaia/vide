echo
echo ==================================
echo === Gerando o pacote com maven ===
echo ==================================
echo
mvn package
echo
echo ==================================
echo === Pacote gerado              ===
echo ==================================
echo
echo
echo ==================================
echo === Removendo pacote do Jboos  ===
echo ==================================
cd /home/mmaia/tools/jboss-4.2.3.GA-ProntoScrum/server/pronto/deploy
rm -R vide.war
echo
echo ==================================
echo === Copiando novo pacote       ===
echo ==================================
echo
cd /home/mmaia/wokspaceGalileoJBossSeam/vide/target
cp vide-1.0.war /home/mmaia/tools/jboss-4.2.3.GA-ProntoScrum/server/pronto/deploy/vide.war
echo
echo ==================================
echo === Deploy Finalizado         ==== 
echo ==================================
