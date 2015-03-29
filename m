From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Mar 2015 12:54:12 +0000
Subject: [PATCH 1/4] staging: rtl8712: Drop unneeded cast on netdev_priv
Message-Id: <1427633655-32103-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: kernel-janitors@vger.kernel.org, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The result of netdev_priv is already implicitly cast to the type of the
left side of the assignment.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
T *x;
@@

x = 
- (T *)
  netdev_priv(...)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/rtl8712/os_intfs.c            |   10 +--
 drivers/staging/rtl8712/rtl871x_ioctl_linux.c |   70 +++++++++++++-------------
 drivers/staging/rtl8712/xmit_linux.c          |    2 
 3 files changed, 41 insertions(+), 41 deletions(-)

diff -u -p a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
--- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
@@ -363,7 +363,7 @@ static inline char *translate_scan(struc
 
 static int wpa_set_auth_algs(struct net_device *dev, u32 value)
 {
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	int ret = 0;
 
 	if ((value & AUTH_ALG_SHARED_KEY) && (value & AUTH_ALG_OPEN_SYSTEM)) {
@@ -395,7 +395,7 @@ static int wpa_set_encryption(struct net
 	int ret = 0;
 	u32 wep_key_idx, wep_key_len = 0;
 	struct NDIS_802_11_WEP	 *pwep = NULL;
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
@@ -629,7 +629,7 @@ static int r8711_wx_get_name(struct net_
 			     struct iw_request_info *info,
 			     union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	u32 ht_ielen = 0;
 	char *p;
 	u8 ht_cap = false;
@@ -685,7 +685,7 @@ static int r8711_wx_set_freq(struct net_
 			     struct iw_request_info *info,
 			     union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct iw_freq *fwrq = &wrqu->freq;
 	int rc = 0;
 
@@ -721,7 +721,7 @@ static int r8711_wx_get_freq(struct net_
 			     struct iw_request_info *info,
 			     union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ndis_wlan_bssid_ex *pcur_bss = &pmlmepriv->cur_network.network;
 
@@ -740,7 +740,7 @@ static int r8711_wx_set_mode(struct net_
 			     struct iw_request_info *a,
 			     union iwreq_data *wrqu, char *b)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	enum NDIS_802_11_NETWORK_INFRASTRUCTURE networkType;
 
 	switch (wrqu->mode) {
@@ -771,7 +771,7 @@ static int r8711_wx_set_mode(struct net_
 static int r8711_wx_get_mode(struct net_device *dev, struct iw_request_info *a,
 			     union iwreq_data *wrqu, char *b)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) = true)
@@ -790,7 +790,7 @@ static int r871x_wx_set_pmkid(struct net
 			     struct iw_request_info *a,
 			     union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct iw_pmksa *pPMK = (struct iw_pmksa *) extra;
 	u8 strZeroMacAddress[ETH_ALEN] = {0x00};
@@ -1061,7 +1061,7 @@ static int r8711_wx_set_wap(struct net_d
 			 char *extra)
 {
 	int ret = -EINPROGRESS;
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct  __queue *queue = &pmlmepriv->scanned_queue;
 	struct sockaddr *temp = (struct sockaddr *)awrq;
@@ -1110,7 +1110,7 @@ static int r8711_wx_get_wap(struct net_d
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ndis_wlan_bssid_ex *pcur_bss = &pmlmepriv->cur_network.network;
 
@@ -1128,7 +1128,7 @@ static int r871x_wx_set_mlme(struct net_
 			     union iwreq_data *wrqu, char *extra)
 {
 	int ret = 0;
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct iw_mlme *mlme = (struct iw_mlme *) extra;
 
 	if (mlme = NULL)
@@ -1160,7 +1160,7 @@ static int r8711_wx_set_scan(struct net_
 			struct iw_request_info *a,
 			union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 status = true;
 
@@ -1209,7 +1209,7 @@ static int r8711_wx_get_scan(struct net_
 				struct iw_request_info *a,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct  __queue *queue = &pmlmepriv->scanned_queue;
 	struct wlan_network *pnetwork = NULL;
@@ -1263,7 +1263,7 @@ static int r8711_wx_set_essid(struct net
 				struct iw_request_info *a,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct  __queue *queue = &pmlmepriv->scanned_queue;
 	struct wlan_network *pnetwork = NULL;
@@ -1326,7 +1326,7 @@ static int r8711_wx_get_essid(struct net
 				struct iw_request_info *a,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ndis_wlan_bssid_ex *pcur_bss = &pmlmepriv->cur_network.network;
 	u32 len, ret = 0;
@@ -1346,7 +1346,7 @@ static int r8711_wx_set_rate(struct net_
 				struct iw_request_info *a,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	u32 target_rate = wrqu->bitrate.value;
 	u32 fixed = wrqu->bitrate.fixed;
 	u32 ratevalue = 0;
@@ -1418,7 +1418,7 @@ static int r8711_wx_get_rate(struct net_
 			     struct iw_request_info *info,
 			     union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ndis_wlan_bssid_ex *pcur_bss = &pmlmepriv->cur_network.network;
 	struct ieee80211_ht_cap *pht_capie;
@@ -1475,7 +1475,7 @@ static int r8711_wx_get_rts(struct net_d
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 
 	wrqu->rts.value = padapter->registrypriv.rts_thresh;
 	wrqu->rts.fixed = 0;	/* no auto select */
@@ -1486,7 +1486,7 @@ static int r8711_wx_set_frag(struct net_
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 
 	if (wrqu->frag.disabled)
 		padapter->xmitpriv.frag_len = MAX_FRAG_THRESHOLD;
@@ -1503,7 +1503,7 @@ static int r8711_wx_get_frag(struct net_
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 
 	wrqu->frag.value = padapter->xmitpriv.frag_len;
 	wrqu->frag.fixed = 0;	/* no auto select */
@@ -1529,7 +1529,7 @@ static int r8711_wx_set_enc(struct net_d
 	struct NDIS_802_11_WEP	 wep;
 	enum NDIS_802_11_AUTHENTICATION_MODE authmode;
 	struct iw_point *erq = &(wrqu->encoding);
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 
 	key = erq->flags & IW_ENCODE_INDEX;
 	memset(&wep, 0, sizeof(struct NDIS_802_11_WEP));
@@ -1621,7 +1621,7 @@ static int r8711_wx_get_enc(struct net_d
 				union iwreq_data *wrqu, char *keybuf)
 {
 	uint key, ret = 0;
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct iw_point *erq = &(wrqu->encoding);
 	struct	mlme_priv	*pmlmepriv = &(padapter->mlmepriv);
 
@@ -1693,7 +1693,7 @@ static int r871x_wx_set_gen_ie(struct ne
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 
 	return r871x_set_wpa_ie(padapter, extra, wrqu->data.length);
 }
@@ -1702,7 +1702,7 @@ static int r871x_wx_set_auth(struct net_
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct iw_param *param = (struct iw_param *)&(wrqu->param);
 	int paramid;
 	int paramval;
@@ -1849,7 +1849,7 @@ static int r8711_wx_read32(struct net_de
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *keybuf)
 {
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	u32 addr;
 	u32 data32;
 
@@ -1866,7 +1866,7 @@ static int r8711_wx_write32(struct net_d
 				 struct iw_request_info *info,
 				 union iwreq_data *wrqu, char *keybuf)
 {
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	u32 addr;
 	u32 data32;
 
@@ -1894,7 +1894,7 @@ static int r871x_mp_ioctl_hdl(struct net
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct iw_point *p = &wrqu->data;
 	struct oid_par_priv oid_par;
 	struct mp_ioctl_handler *phandler;
@@ -1977,7 +1977,7 @@ static int r871x_get_ap_info(struct net_
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct  __queue *queue = &pmlmepriv->scanned_queue;
 	struct iw_point *pdata = &wrqu->data;
@@ -2048,7 +2048,7 @@ static int r871x_set_pid(struct net_devi
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct iw_point *pdata = &wrqu->data;
 
 	if ((padapter->bDriverStopped) || (pdata = NULL))
@@ -2063,7 +2063,7 @@ static int r871x_set_chplan(struct net_d
 				union iwreq_data *wrqu, char *extra)
 {
 	int ret = 0;
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct iw_point *pdata = &wrqu->data;
 	int ch_plan = -1;
 
@@ -2083,7 +2083,7 @@ static int r871x_wps_start(struct net_de
 			   struct iw_request_info *info,
 			   union iwreq_data *wrqu, char *extra)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct iw_point *pdata = &wrqu->data;
 	u32   u32wps_start = 0;
 
@@ -2107,7 +2107,7 @@ static int r871x_wps_start(struct net_de
 
 static int wpa_set_param(struct net_device *dev, u8 name, u32 value)
 {
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 
 	switch (name) {
 	case IEEE_PARAM_WPA_ENABLED:
@@ -2159,7 +2159,7 @@ static int wpa_set_param(struct net_devi
 
 static int wpa_mlme(struct net_device *dev, u32 command, u32 reason)
 {
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 
 	switch (command) {
 	case IEEE_MLME_STA_DEAUTH:
@@ -2180,7 +2180,7 @@ static int wpa_supplicant_ioctl(struct n
 {
 	struct ieee_param *param;
 	int ret = 0;
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 
 	if (p->length < sizeof(struct ieee_param) || !p->pointer)
 		return -EINVAL;
@@ -2333,7 +2333,7 @@ static iw_handler r8711_private_handler[
 
 static struct iw_statistics *r871x_get_wireless_stats(struct net_device *dev)
 {
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(dev);
+	struct _adapter *padapter = netdev_priv(dev);
 	struct iw_statistics *piwstats = &padapter->iwstats;
 	int tmp_level = 0;
 	int tmp_qual = 0;
diff -u -p a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
--- a/drivers/staging/rtl8712/xmit_linux.c
+++ b/drivers/staging/rtl8712/xmit_linux.c
@@ -162,7 +162,7 @@ void r8712_xmit_complete(struct _adapter
 int r8712_xmit_entry(_pkt *pkt, struct  net_device *pnetdev)
 {
 	struct xmit_frame *pxmitframe = NULL;
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(pnetdev);
+	struct _adapter *padapter = netdev_priv(pnetdev);
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	int ret = 0;
 
diff -u -p a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -177,7 +177,7 @@ static uint loadparam(struct _adapter *p
 
 static int r871x_net_set_mac_address(struct net_device *pnetdev, void *p)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(pnetdev);
+	struct _adapter *padapter = netdev_priv(pnetdev);
 	struct sockaddr *addr = p;
 
 	if (padapter->bup = false)
@@ -187,7 +187,7 @@ static int r871x_net_set_mac_address(str
 
 static struct net_device_stats *r871x_net_get_stats(struct net_device *pnetdev)
 {
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(pnetdev);
+	struct _adapter *padapter = netdev_priv(pnetdev);
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct recv_priv *precvpriv = &(padapter->recvpriv);
 
@@ -221,7 +221,7 @@ struct net_device *r8712_init_netdev(voi
 		strcpy(ifname, "wlan%d");
 		dev_alloc_name(pnetdev, ifname);
 	}
-	padapter = (struct _adapter *) netdev_priv(pnetdev);
+	padapter = netdev_priv(pnetdev);
 	padapter->pnetdev = pnetdev;
 	pr_info("r8712u: register rtl8712_netdev_ops to netdev_ops\n");
 	pnetdev->netdev_ops = &rtl8712_netdev_ops;
@@ -384,7 +384,7 @@ static void enable_video_mode(struct _ad
  */
 static int netdev_open(struct net_device *pnetdev)
 {
-	struct _adapter *padapter = (struct _adapter *)netdev_priv(pnetdev);
+	struct _adapter *padapter = netdev_priv(pnetdev);
 
 	mutex_lock(&padapter->mutex_start);
 	if (padapter->bup = false) {
@@ -452,7 +452,7 @@ netdev_open_error:
  */
 static int netdev_close(struct net_device *pnetdev)
 {
-	struct _adapter *padapter = (struct _adapter *) netdev_priv(pnetdev);
+	struct _adapter *padapter = netdev_priv(pnetdev);
 
 	/* Close LED*/
 	padapter->ledpriv.LedControlHandler(padapter, LED_CTL_POWER_OFF);

