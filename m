From: Andrei Emeltchenko <andrei.emeltchenko@intel.com>
Date: Mon, 01 Oct 2012 07:56:30 +0000
Subject: Re: [bluetooth:master 222/247] net/bluetooth/a2mp.c:205 a2mp_getinfo_req() error: we previously assu
Message-Id: <20121001075629.GF10053@aemeltch-MOBL1>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="y0ulUmNC+osPPQO6"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gustavo,

Have you checked my patch fixing this issue, I sent it of Friday,
attaching it here just in case.

Best regards 
Andrei Emeltchenko 

On Fri, Sep 28, 2012 at 09:23:23AM +0800, Fengguang Wu wrote:
> Hi Andrei,
> 
> FYI, there are new smatch warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
> head:   29d8a5909bba10accb82eb805c884a2943d7710f
> commit: 8e2a0d92c56ec6955526a8b60838c9b00f70540d [222/247] Bluetooth: AMP: Use HCI cmd to Read AMP Info
> 
>   net/bluetooth/a2mp.c:61 a2mp_send() Error invalid range 4096 to -1
> + net/bluetooth/a2mp.c:205 a2mp_getinfo_req() error: we previously assumed 'hdev' could be null (see line 195)
> 
> vim +205 net/bluetooth/a2mp.c
> 
> 47f2d97d (Andrei Emeltchenko 2012-05-29  189) 	if (le16_to_cpu(hdr->len) < sizeof(*req))
> 47f2d97d (Andrei Emeltchenko 2012-05-29  190) 		return -EINVAL;
> 47f2d97d (Andrei Emeltchenko 2012-05-29  191) 
> 47f2d97d (Andrei Emeltchenko 2012-05-29  192) 	BT_DBG("id %d", req->id);
> 47f2d97d (Andrei Emeltchenko 2012-05-29  193) 
> 47f2d97d (Andrei Emeltchenko 2012-05-29  194) 	hdev = hci_dev_get(req->id);
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27 @195) 	if (!hdev) {
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27  196) 		struct a2mp_info_rsp rsp;
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27  197) 
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27  198) 		rsp.id = req->id;
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27  199) 		rsp.status = A2MP_STATUS_INVALID_CTRL_ID;
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27  200) 
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27  201) 		a2mp_send(mgr, A2MP_GETINFO_RSP, hdr->ident, sizeof(rsp),
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27  202) 			  &rsp);
> 47f2d97d (Andrei Emeltchenko 2012-05-29  203) 	}
> 47f2d97d (Andrei Emeltchenko 2012-05-29  204) 
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27 @205) 	if (hdev->dev_type != HCI_BREDR) {
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27  206) 		mgr->state = READ_LOC_AMP_INFO;
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27  207) 		hci_send_cmd(hdev, HCI_OP_READ_LOCAL_AMP_INFO, 0, NULL);
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27  208) 	}
> 47f2d97d (Andrei Emeltchenko 2012-05-29  209) 
> 8e2a0d92 (Andrei Emeltchenko 2012-09-27  210) 	hci_dev_put(hdev);
> 47f2d97d (Andrei Emeltchenko 2012-05-29  211) 
> 47f2d97d (Andrei Emeltchenko 2012-05-29  212) 	skb_pull(skb, sizeof(*req));
> 47f2d97d (Andrei Emeltchenko 2012-05-29  213) 	return 0;
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--y0ulUmNC+osPPQO6
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-Bluetooth-A2MP-Fix-potential-NULL-dereference.patch"

From 69ad5c2634b4207317d8ce49f765d748ca27c487 Mon Sep 17 00:00:00 2001
From: Andrei Emeltchenko <andrei.emeltchenko@intel.com>
Date: Fri, 28 Sep 2012 14:03:35 +0300
Subject: [RESEND PATCH] Bluetooth: A2MP: Fix potential NULL dereference

Return INVALID_CTRL_ID for unknown AMP controller and for BR/EDR
controller and fixes dereference possible NULL pointer. Issue reported
by Fengguang Wu <fengguang.wu@intel.com>.

Signed-off-by: Andrei Emeltchenko <andrei.emeltchenko@intel.com>
---
 net/bluetooth/a2mp.c |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/a2mp.c b/net/bluetooth/a2mp.c
index 42788cd..d4946b5 100644
--- a/net/bluetooth/a2mp.c
+++ b/net/bluetooth/a2mp.c
@@ -278,7 +278,7 @@ static int a2mp_getinfo_req(struct amp_mgr *mgr, struct sk_buff *skb,
 	BT_DBG("id %d", req->id);
 
 	hdev = hci_dev_get(req->id);
-	if (!hdev) {
+	if (!hdev || hdev->dev_type != HCI_AMP) {
 		struct a2mp_info_rsp rsp;
 
 		rsp.id = req->id;
@@ -286,14 +286,16 @@ static int a2mp_getinfo_req(struct amp_mgr *mgr, struct sk_buff *skb,
 
 		a2mp_send(mgr, A2MP_GETINFO_RSP, hdr->ident, sizeof(rsp),
 			  &rsp);
-	}
 
-	if (hdev->dev_type != HCI_BREDR) {
-		mgr->state = READ_LOC_AMP_INFO;
-		hci_send_cmd(hdev, HCI_OP_READ_LOCAL_AMP_INFO, 0, NULL);
+		goto done;
 	}
 
-	hci_dev_put(hdev);
+	mgr->state = READ_LOC_AMP_INFO;
+	hci_send_cmd(hdev, HCI_OP_READ_LOCAL_AMP_INFO, 0, NULL);
+
+done:
+	if (hdev)
+		hci_dev_put(hdev);
 
 	skb_pull(skb, sizeof(*req));
 	return 0;
-- 
1.7.9.5


--y0ulUmNC+osPPQO6--

