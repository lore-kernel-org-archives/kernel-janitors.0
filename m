From: maximilian attems <janitor@sternwelten.at>
Date: Sat, 14 Aug 2004 19:30:00 +0000
Subject: Re: [Kernel-janitors] [patch 2.6.8-rc2] replace dprintk with pr_debug
Message-Id: <20040814193000.GM1756@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============034355674582153384=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040724211801.GA3633@masina.coderock.org>
In-Reply-To: <20040724211801.GA3633@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============034355674582153384==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, 24 Jul 2004, Domen Puncer wrote:

> Hi.
> 
> Replaced dprintk, and deleted it out of tpam.h.
> Compile tested.
> 
> 
>  drivers/isdn/tpam/tpam.h          |   11 +-------
>  drivers/isdn/tpam/tpam_commands.c |   50 +++++++++++++++++++-------------------
>  drivers/isdn/tpam/tpam_nco.c      |   34 ++++++++++++-------------
>  drivers/isdn/tpam/tpam_queues.c   |   26 +++++++++----------
>  4 files changed, 57 insertions(+), 64 deletions(-)
> 
> 
> Signed-off-by: Domen Puncer <domen@coderock.org>
> 
> diff -pruNX dontdiff c/drivers/isdn/tpam/tpam.h a/drivers/isdn/tpam/tpam.h
> --- c/drivers/isdn/tpam/tpam.h	Fri Jul 23 16:00:20 2004
> +++ a/drivers/isdn/tpam/tpam.h	Sat Jul 24 23:45:38 2004
> @@ -14,6 +14,8 @@
>  #ifndef _TPAM_PRIV_H_
>  #define _TPAM_PRIV_H_
>  
> +//#define DEBUG /* uncomment if you want debugging output */
> +#include <linux/kernel.h>
>  #include <linux/isdnif.h>
>  #include <linux/init.h>
>  #include <linux/workqueue.h>
> @@ -223,14 +225,5 @@ extern void init_CRC(void);
>  extern void hdlc_encode_modem(u8 *, u32, u8 *, u32 *);
>  extern void hdlc_no_accm_encode(u8 *, u32, u8 *, u32 *);
>  extern u32 hdlc_no_accm_decode(u8 *, u32);
> -
> -/* Define this to enable debug tracing prints */
> -#undef DEBUG
> -
> -#ifdef DEBUG
> -#define dprintk printk
> -#else
> -#define dprintk while(0) printk
> -#endif
>  
>  #endif /* _TPAM_H_ */
> diff -pruNX dontdiff c/drivers/isdn/tpam/tpam_commands.c a/drivers/isdn/tpam/tpam_commands.c
> --- c/drivers/isdn/tpam/tpam_commands.c	Fri Jul 23 16:00:20 2004
> +++ a/drivers/isdn/tpam/tpam_commands.c	Sat Jul 24 23:32:31 2004
> @@ -45,7 +45,7 @@ int tpam_command(isdn_ctrl *c) {
>  	tpam_card *card;
>  	unsigned long argp;
>  
> -	dprintk("TurboPAM(tpam_command) card=%d, command=%d\n", 
> +	pr_debug("TurboPAM(tpam_command) card=%d, command=%d\n", 
								^
>  		c->driver, c->command);	
>  
>  	/* search for the board */
> @@ -75,7 +75,7 @@ int tpam_command(isdn_ctrl *c) {
>  					return tpam_command_ioctl_loopmode(card,
>  									   0);
>  				default:
> -					dprintk("TurboPAM(tpam_command): "
> +					pr_debug("TurboPAM(tpam_command): "
>  						"invalid tpam ioctl %ld\n", 
>  						c->arg);	
>  					return -EINVAL;
> @@ -95,7 +95,7 @@ int tpam_command(isdn_ctrl *c) {
>  		case ISDN_CMD_PROCEED:
>  			return tpam_command_proceed(card, c->arg);
>  		default:
> -			dprintk("TurboPAM(tpam_command): "
> +			pr_debug("TurboPAM(tpam_command): "
>  				"unknown or unused isdn ioctl %d\n", 
>  				c->command);	
>  			return -EINVAL;
> @@ -117,7 +117,7 @@ int tpam_command(isdn_ctrl *c) {
>  static int tpam_command_ioctl_dspload(tpam_card *card, u32 arg) {
>  	tpam_dsp_ioctl tdl;
>  
> -	dprintk("TurboPAM(tpam_command_ioctl_dspload): card=%d\n", card->id);
> +	pr_debug("TurboPAM(tpam_command_ioctl_dspload): card=%d\n", card->id);
>  
>  	/* get the IOCTL parameter from userspace */
>  	if (copy_from_user(&tdl, (void __user *)arg, sizeof(tpam_dsp_ioctl)))
> @@ -147,7 +147,7 @@ static int tpam_command_ioctl_dspload(tp
>  static int tpam_command_ioctl_dspsave(tpam_card *card, u32 arg) {
>  	tpam_dsp_ioctl tdl;
>  
> -	dprintk("TurboPAM(tpam_command_ioctl_dspsave): card=%d\n", card->id);
> +	pr_debug("TurboPAM(tpam_command_ioctl_dspsave): card=%d\n", card->id);
>  
>  	/* get the IOCTL parameter from userspace */
>  	if (copy_from_user(&tdl, (void __user *)arg, sizeof(tpam_dsp_ioctl)))
> @@ -178,7 +178,7 @@ static int tpam_command_ioctl_dsprun(tpa
>  	isdn_ctrl ctrl;
>  	struct sk_buff *skb;
>  
> -	dprintk("TurboPAM(tpam_command_ioctl_dsprun): card=%d\n", card->id);
> +	pr_debug("TurboPAM(tpam_command_ioctl_dsprun): card=%d\n", card->id);
>  
>  	/* board must _not_ be running */
>  	if (card->running)
> @@ -297,7 +297,7 @@ static int tpam_command_dial(tpam_card *
>  	struct sk_buff *skb;
>  	isdn_ctrl ctrl;
>  
> -	dprintk("TurboPAM(tpam_command_dial): card=%d, channel=%lu, phone=%s\n",
> +	pr_debug("TurboPAM(tpam_command_dial): card=%d, channel=%lu, phone=%s\n",
>  		card->id, (unsigned long)channel, phone);
>  
>  	/* board must be running */
> @@ -341,7 +341,7 @@ static int tpam_command_dial(tpam_card *
>   */
>  static int tpam_command_setl2(tpam_card *card, u32 channel, u8 proto) {
>  
> -	dprintk("TurboPAM(tpam_command_setl2): card=%d, channel=%lu, proto=%d\n",
> +	pr_debug("TurboPAM(tpam_command_setl2): card=%d, channel=%lu, proto=%d\n",
>  		card->id, (unsigned long)channel, proto);
>  
>  	/* board must be running */
> @@ -376,7 +376,7 @@ static int tpam_command_acceptd(tpam_car
>  	isdn_ctrl ctrl;
>  	struct sk_buff *skb;
>  
> -	dprintk("TurboPAM(tpam_command_acceptd): card=%d, channel=%lu\n",
> +	pr_debug("TurboPAM(tpam_command_acceptd): card=%d, channel=%lu\n",
>  		card->id, (unsigned long)channel);
>  
>  	/* board must be running */
> @@ -410,7 +410,7 @@ static int tpam_command_acceptd(tpam_car
>  static int tpam_command_acceptb(tpam_card *card, u32 channel) {
>  	isdn_ctrl ctrl;
>  
> -	dprintk("TurboPAM(tpam_command_acceptb): card=%d, channel=%lu\n",
> +	pr_debug("TurboPAM(tpam_command_acceptb): card=%d, channel=%lu\n",
>  		card->id, (unsigned long)channel);
>  
>  	/* board must be running */
> @@ -437,7 +437,7 @@ static int tpam_command_acceptb(tpam_car
>  static int tpam_command_hangup(tpam_card *card, u32 channel) {
>  	struct sk_buff *skb;
>  
> -	dprintk("TurboPAM(tpam_command_hangup): card=%d, channel=%lu\n",
> +	pr_debug("TurboPAM(tpam_command_hangup): card=%d, channel=%lu\n",
>  		card->id, (unsigned long)channel);
>  
>  	/* board must be running */
> @@ -464,7 +464,7 @@ static int tpam_command_hangup(tpam_card
>  static int tpam_command_proceed(tpam_card *card, u32 channel) {
>  	struct sk_buff *skb;
>  
> -	dprintk("TurboPAM(tpam_command_proceed): card=%d, channel=%lu\n",
> +	pr_debug("TurboPAM(tpam_command_proceed): card=%d, channel=%lu\n",
>  		card->id, (unsigned long)channel);
>  
>  	/* board must be running */
> @@ -496,7 +496,7 @@ int tpam_writebuf_skb(int driverId, int 
>  	void *finaldata;
>  	u32 finallen;
>  
> -	dprintk("TurboPAM(tpam_writebuf_skb): "
> +	pr_debug("TurboPAM(tpam_writebuf_skb): "
>  		"card=%d, channel=%ld, ack=%d, data size=%d\n", 
>  		driverId, (unsigned long)channel, ack, skb->len);
>  
> @@ -569,7 +569,7 @@ void tpam_recv_ACreateNCOCnf(tpam_card *
>  	u8 status;
>  	u32 channel;
>  
> -	dprintk("TurboPAM(tpam_recv_ACreateNCOCnf): card=%d\n", card->id);
> +	pr_debug("TurboPAM(tpam_recv_ACreateNCOCnf): card=%d\n", card->id);
>  
>  	/* parse the message contents */
>  	if (parse_ACreateNCOCnf(skb, &status, &ncoid))
> @@ -614,7 +614,7 @@ void tpam_recv_ADestroyNCOCnf(tpam_card 
>  	u8 status;
>  	u32 channel;
>  
> -	dprintk("TurboPAM(tpam_recv_ADestroyNCOCnf): card=%d\n", card->id);
> +	pr_debug("TurboPAM(tpam_recv_ADestroyNCOCnf): card=%d\n", card->id);
>  
>  	/* parse the message contents */
>  	if (parse_ADestroyNCOCnf(skb, &status, &ncoid))
> @@ -647,7 +647,7 @@ void tpam_recv_CConnectCnf(tpam_card *ca
>  	u32 channel;
>  	isdn_ctrl ctrl;
>  
> -	dprintk("TurboPAM(tpam_recv_CConnectCnf): card=%d\n", card->id);
> +	pr_debug("TurboPAM(tpam_recv_CConnectCnf): card=%d\n", card->id);
>  
>  	/* parse the message contents */
>  	if (parse_CConnectCnf(skb, &ncoid))
> @@ -685,7 +685,7 @@ void tpam_recv_CConnectInd(tpam_card *ca
>  	isdn_ctrl ctrl;
>  	int status;
>  
> -	dprintk("TurboPAM(tpam_recv_CConnectInd): card=%d\n", card->id);
> +	pr_debug("TurboPAM(tpam_recv_CConnectInd): card=%d\n", card->id);
>  
>  	/* parse the message contents */
>  	if (parse_CConnectInd(skb, &ncoid, &hdlc, calling, called, &plan, &screen))
> @@ -720,13 +720,13 @@ void tpam_recv_CConnectInd(tpam_card *ca
>  		case 4:
>  			/* call accepted, link layer will send us a ACCEPTD 
>  			 * command later */
> -			dprintk("TurboPAM(tpam_recv_CConnectInd): "
> +			pr_debug("TurboPAM(tpam_recv_CConnectInd): "
>  				"card=%d, channel=%d, icall waiting, status=%d\n", 
>  				card->id, channel, status);
>  			break;
>  		default:
>  			/* call denied, we build and send a CDisconnectReq */
> -			dprintk("TurboPAM(tpam_recv_CConnectInd): "
> +			pr_debug("TurboPAM(tpam_recv_CConnectInd): "
>  				"card=%d, channel=%d, icall denied, status=%d\n", 
>  				card->id, channel, status);
>  			skb = build_CDisconnectReq(ncoid);
> @@ -749,7 +749,7 @@ void tpam_recv_CDisconnectInd(tpam_card 
>  	u32 cause;
>  	isdn_ctrl ctrl;
>  
> -	dprintk("TurboPAM(tpam_recv_CDisconnectInd): card=%d\n", card->id);
> +	pr_debug("TurboPAM(tpam_recv_CDisconnectInd): card=%d\n", card->id);
>  
>  	/* parse the message contents */
>  	if (parse_CDisconnectInd(skb, &ncoid, &cause))
> @@ -794,7 +794,7 @@ void tpam_recv_CDisconnectCnf(tpam_card 
>  	u32 cause;
>  	isdn_ctrl ctrl;
>  
> -	dprintk("TurboPAM(tpam_recv_CDisconnectCnf): card=%d\n", card->id);
> +	pr_debug("TurboPAM(tpam_recv_CDisconnectCnf): card=%d\n", card->id);
>  
>  	/* parse the message contents */
>  	if (parse_CDisconnectCnf(skb, &ncoid, &cause))
> @@ -835,7 +835,7 @@ void tpam_recv_U3DataInd(tpam_card *card
>  	u16 len;
>  	struct sk_buff *result;
>  
> -	dprintk("TurboPAM(tpam_recv_U3DataInd): card=%d, datalen=%d\n", 
> +	pr_debug("TurboPAM(tpam_recv_U3DataInd): card=%d, datalen=%d\n", 
two
>  		card->id, skb->len);
>  
>  	/* parse the message contents */
> @@ -914,7 +914,7 @@ void tpam_recv_U3ReadyToReceiveInd(tpam_
>  	u32 channel;
>  	u8 ready;
>  
> -	dprintk("TurboPAM(tpam_recv_U3ReadyToReceiveInd): card=%d\n", card->id);
> +	pr_debug("TurboPAM(tpam_recv_U3ReadyToReceiveInd): card=%d\n", card->id);
>  
>  	/* parse the message contents */
>  	if (parse_U3ReadyToReceiveInd(skb, &ncoid, &ready))
> @@ -943,7 +943,7 @@ void tpam_recv_U3ReadyToReceiveInd(tpam_
>  static void tpam_statcallb_run(unsigned long parm) {
>  	tpam_statcallb_data *ds = (tpam_statcallb_data *)parm;
>  
> -	dprintk("TurboPAM(tpam_statcallb_run)\n");
> +	pr_debug("TurboPAM(tpam_statcallb_run)\n");
>  
>  	(* ds->card->interface.statcallb)(&ds->ctrl);
>  
> @@ -961,7 +961,7 @@ static void tpam_statcallb(tpam_card *ca
>  	struct timer_list *timer;
>  	tpam_statcallb_data *ds;
>  
> -	dprintk("TurboPAM(tpam_statcallb): card=%d\n", card->id);
> +	pr_debug("TurboPAM(tpam_statcallb): card=%d\n", card->id);
>  
>  	if (!(timer = (struct timer_list *) kmalloc(sizeof(struct timer_list), 
>  						    GFP_ATOMIC))) {
> diff -pruNX dontdiff c/drivers/isdn/tpam/tpam_nco.c a/drivers/isdn/tpam/tpam_nco.c
> --- c/drivers/isdn/tpam/tpam_nco.c	Wed Jun 16 07:19:01 2004
> +++ a/drivers/isdn/tpam/tpam_nco.c	Sat Jul 24 23:33:06 2004
> @@ -84,7 +84,7 @@ struct sk_buff *build_ACreateNCOReq(cons
>  	struct sk_buff *skb;
>  	u8 *tlv;
>  
> -	dprintk("TurboPAM(build_ACreateNCOReq): phone=%s\n", phone);
> +	pr_debug("TurboPAM(build_ACreateNCOReq): phone=%s\n", phone);
>  
>  	/* build the NCO packet */
>  	if (!(skb = build_NCOpacket(ID_ACreateNCOReq, 23 + strlen(phone), 0, 0, 0))) 
> @@ -141,7 +141,7 @@ struct sk_buff *build_ADestroyNCOReq(u32
>  	struct sk_buff *skb;
>  	u8 *tlv;
>  
> -	dprintk("TurboPAM(build_ADestroyNCOReq): ncoid=%lu\n", 
> +	pr_debug("TurboPAM(build_ADestroyNCOReq): ncoid=%lu\n", 
3
>  		(unsigned long)ncoid);
>  
>  	/* build the NCO packet */
> @@ -170,7 +170,7 @@ struct sk_buff *build_CConnectReq(u32 nc
>  	struct sk_buff *skb;
>  	u8 *tlv;
>  
> -	dprintk("TurboPAM(build_CConnectReq): ncoid=%lu, called=%s, hdlc=%d\n",
> +	pr_debug("TurboPAM(build_CConnectReq): ncoid=%lu, called=%s, hdlc=%d\n",
>  		(unsigned long)ncoid, called, hdlc);
>  
>  	/* build the NCO packet */
> @@ -220,7 +220,7 @@ struct sk_buff *build_CConnectRsp(u32 nc
>  	struct sk_buff *skb;
>  	u8 *tlv;
>  
> -	dprintk("TurboPAM(build_CConnectRsp): ncoid=%lu\n",
> +	pr_debug("TurboPAM(build_CConnectRsp): ncoid=%lu\n",
>  		(unsigned long)ncoid);
>  
>  	/* build the NCO packet */
> @@ -247,7 +247,7 @@ struct sk_buff *build_CDisconnectReq(u32
>  	struct sk_buff *skb;
>  	u8 *tlv;
>  
> -	dprintk("TurboPAM(build_CDisconnectReq): ncoid=%lu\n",
> +	pr_debug("TurboPAM(build_CDisconnectReq): ncoid=%lu\n",
>  		(unsigned long)ncoid);
>  
>  	/* build the NCO packet */
> @@ -274,7 +274,7 @@ struct sk_buff *build_CDisconnectRsp(u32
>  	struct sk_buff *skb;
>  	u8 *tlv;
>  
> -	dprintk("TurboPAM(build_CDisconnectRsp): ncoid=%lu\n",
> +	pr_debug("TurboPAM(build_CDisconnectRsp): ncoid=%lu\n",
>  		(unsigned long)ncoid);
>  
>  	/* build the NCO packet */
> @@ -307,7 +307,7 @@ struct sk_buff *build_U3DataReq(u32 ncoi
>  	u8 *tlv;
>  	void *p;
>  
> -	dprintk("TurboPAM(build_U3DataReq): "
> +	pr_debug("TurboPAM(build_U3DataReq): "
>  		"ncoid=%lu, len=%d, ack=%d, ack_size=%d\n", 
>  		(unsigned long)ncoid, len, ack, ack_size);
>  
> @@ -397,7 +397,7 @@ int parse_ACreateNCOCnf(struct sk_buff *
>  	}
>  
>  	if (*status) {
> -		dprintk("TurboPAM(parse_ACreateNCOCnf): status=%d\n", *status);
> +		pr_debug("TurboPAM(parse_ACreateNCOCnf): status=%d\n", *status);
>  		return 0;
>  	}
>  
> @@ -408,7 +408,7 @@ int parse_ACreateNCOCnf(struct sk_buff *
>  		return -1;
>  	}
>  
> -	dprintk("TurboPAM(parse_ACreateNCOCnf): ncoid=%lu, status=%d\n",
> +	pr_debug("TurboPAM(parse_ACreateNCOCnf): ncoid=%lu, status=%d\n",
>  		(unsigned long)*ncoid, *status);
>  	return 0;
>  }
> @@ -432,7 +432,7 @@ int parse_ADestroyNCOCnf(struct sk_buff 
>  	}
>  
>  	if (*status) {
> -		dprintk("TurboPAM(parse_ADestroyNCOCnf): status=%d\n", *status);
> +		pr_debug("TurboPAM(parse_ADestroyNCOCnf): status=%d\n", *status);
>  		return 0;
>  	}
>  
> @@ -443,7 +443,7 @@ int parse_ADestroyNCOCnf(struct sk_buff 
>  		return -1;
>  	}
>  
> -	dprintk("TurboPAM(parse_ADestroyNCOCnf): ncoid=%lu, status=%d\n", 
> +	pr_debug("TurboPAM(parse_ADestroyNCOCnf): ncoid=%lu, status=%d\n", 
4

5 more corrected for kjt, were infact already existent before,
nevertheless please take care :)
a++ maks


--===============034355674582153384==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============034355674582153384==--
