#USE AT YOUR OWN RISK!!!
#This fixes pptp client issues with my DD-WRT v24-sp2 on a Buffalo router
#paste this as startup script in the Administration->Commands->Command Shell, press "save startup" and reboot

fork_pptp_change() {
pptpfile=/tmp/pptpd_client/options.vpn
while [[ ! -f $pptpfile ]]
do
  sleep 2
done
sleep 10
sed -i '$ anobsdcomp'  /tmp/pptpd_client/options.vpn
sed -i '$ anodeflate' /tmp/pptpd_client/options.vpn
sed -i '$ arefuse-pap' /tmp/pptpd_client/options.vpn
sed -i '$ arefuse-chap' /tmp/pptpd_client/options.vpn
sed -i '$ arefuse-mschap' /tmp/pptpd_client/options.vpn
sed -i '/logfd2/d' /tmp/pptpd_client/options.vpn
sed -i '/debug/d' /tmp/pptpd_client/options.vpn
sed -i '/dump/d' /tmp/pptpd_client/options.vpn
/tmp/pptpd_client/vpn stop
sleep 5
/tmp/pptpd_client/vpn start &
}

fork_pptp_change &
