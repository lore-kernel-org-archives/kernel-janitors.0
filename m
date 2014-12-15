From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Dec 2014 21:56:43 +0000
Subject: re: Mailbox: Add support for Platform Communication Channel
Message-Id: <20141215215643.GA2882@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ashwin Chaugule,

The patch 86c22f8c9a3b: "Mailbox: Add support for Platform
Communication Channel" from Nov 12, 2014, leads to the following
static checker warning:

	drivers/mailbox/pcc.c:119 pcc_mbox_request_channel()
	error: 'chan' dereferencing possible ERR_PTR()

drivers/mailbox/pcc.c
   110          /*
   111           * Each PCC Subspace is a Mailbox Channel.
   112           * The PCC Clients get their PCC Subspace ID
   113           * from their own tables and pass it here.
   114           * This returns a pointer to the PCC subspace
   115           * for the Client to operate on.
   116           */
   117          chan = get_pcc_channel(subspace_id);
   118  
   119          if (!chan || chan->cl) {
                    ^^^^^
Should be checking IS_ERR().  Also is the error message correct?

   120                  dev_err(dev, "%s: PCC mailbox not free\n", __func__);
   121                  return ERR_PTR(-EBUSY);
   122          }

	drivers/mailbox/pcc.c:220 pcc_send_data()
	warn: impossible condition '(ss_idx < 0) => (0-65535 < 0)'

   215          u16 cmd = *(u16 *) data;
   216          u16 ss_idx = -1;
                ^^^^^^^^^^^^^^^^

Make this an int.  Remove the bogus initializer.

   217  
   218          ss_idx = get_subspace_id(chan);
   219  

Don't put a blank line between the function calls and the error
handling, they are part of the same paragraph.

   220          if (ss_idx < 0) {
   221                  pr_err("Invalid Subspace ID from PCC client\n");
   222                  return -EINVAL;
   223          }
   224  

Also this file has some Sparse warnings:

drivers/mailbox/pcc.c:103:18: warning: symbol 'pcc_mbox_request_channel' was not declared. Should it be static?
drivers/mailbox/pcc.c:146:6: warning: symbol 'pcc_mbox_free_channel' was not declared. Should it be static?
drivers/mailbox/pcc.c:180:18: warning: incorrect type in argument 1 (different address spaces)
drivers/mailbox/pcc.c:180:18:    expected void const volatile [noderef] <asn:2>*addr
drivers/mailbox/pcc.c:180:18:    got unsigned short *<noident>
drivers/mailbox/pcc.c:230:22: warning: incorrect type in argument 2 (different address spaces)
drivers/mailbox/pcc.c:230:22:    expected void volatile [noderef] <asn:2>*addr
drivers/mailbox/pcc.c:230:22:    got unsigned short *<noident>
drivers/mailbox/pcc.c:233:47: warning: incorrect type in argument 2 (different address spaces)
drivers/mailbox/pcc.c:233:47:    expected void volatile [noderef] <asn:2>*addr
drivers/mailbox/pcc.c:233:47:    got unsigned int *<noident>
drivers/mailbox/pcc.c:236:20: warning: incorrect type in argument 2 (different address spaces)
drivers/mailbox/pcc.c:236:20:    expected void volatile [noderef] <asn:2>*addr
drivers/mailbox/pcc.c:236:20:    got unsigned short *<noident>
drivers/mailbox/pcc.c:369:24: warning: symbol 'pcc_mbox_driver' was not declared. Should it be static?

regards,
dan carpenter
