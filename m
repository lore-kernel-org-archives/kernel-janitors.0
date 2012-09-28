From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 01:23:23 +0000
Subject: [bluetooth:master 222/247] net/bluetooth/a2mp.c:205 a2mp_getinfo_req() error: we previously assumed
Message-Id: <20120928012323.GG5522@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andrei,

FYI, there are new smatch warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
head:   29d8a5909bba10accb82eb805c884a2943d7710f
commit: 8e2a0d92c56ec6955526a8b60838c9b00f70540d [222/247] Bluetooth: AMP: Use HCI cmd to Read AMP Info

  net/bluetooth/a2mp.c:61 a2mp_send() Error invalid range 4096 to -1
+ net/bluetooth/a2mp.c:205 a2mp_getinfo_req() error: we previously assumed 'hdev' could be null (see line 195)

vim +205 net/bluetooth/a2mp.c

47f2d97d (Andrei Emeltchenko 2012-05-29  189) 	if (le16_to_cpu(hdr->len) < sizeof(*req))
47f2d97d (Andrei Emeltchenko 2012-05-29  190) 		return -EINVAL;
47f2d97d (Andrei Emeltchenko 2012-05-29  191) 
47f2d97d (Andrei Emeltchenko 2012-05-29  192) 	BT_DBG("id %d", req->id);
47f2d97d (Andrei Emeltchenko 2012-05-29  193) 
47f2d97d (Andrei Emeltchenko 2012-05-29  194) 	hdev = hci_dev_get(req->id);
8e2a0d92 (Andrei Emeltchenko 2012-09-27 @195) 	if (!hdev) {
8e2a0d92 (Andrei Emeltchenko 2012-09-27  196) 		struct a2mp_info_rsp rsp;
8e2a0d92 (Andrei Emeltchenko 2012-09-27  197) 
8e2a0d92 (Andrei Emeltchenko 2012-09-27  198) 		rsp.id = req->id;
8e2a0d92 (Andrei Emeltchenko 2012-09-27  199) 		rsp.status = A2MP_STATUS_INVALID_CTRL_ID;
8e2a0d92 (Andrei Emeltchenko 2012-09-27  200) 
8e2a0d92 (Andrei Emeltchenko 2012-09-27  201) 		a2mp_send(mgr, A2MP_GETINFO_RSP, hdr->ident, sizeof(rsp),
8e2a0d92 (Andrei Emeltchenko 2012-09-27  202) 			  &rsp);
47f2d97d (Andrei Emeltchenko 2012-05-29  203) 	}
47f2d97d (Andrei Emeltchenko 2012-05-29  204) 
8e2a0d92 (Andrei Emeltchenko 2012-09-27 @205) 	if (hdev->dev_type != HCI_BREDR) {
8e2a0d92 (Andrei Emeltchenko 2012-09-27  206) 		mgr->state = READ_LOC_AMP_INFO;
8e2a0d92 (Andrei Emeltchenko 2012-09-27  207) 		hci_send_cmd(hdev, HCI_OP_READ_LOCAL_AMP_INFO, 0, NULL);
8e2a0d92 (Andrei Emeltchenko 2012-09-27  208) 	}
47f2d97d (Andrei Emeltchenko 2012-05-29  209) 
8e2a0d92 (Andrei Emeltchenko 2012-09-27  210) 	hci_dev_put(hdev);
47f2d97d (Andrei Emeltchenko 2012-05-29  211) 
47f2d97d (Andrei Emeltchenko 2012-05-29  212) 	skb_pull(skb, sizeof(*req));
47f2d97d (Andrei Emeltchenko 2012-05-29  213) 	return 0;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
