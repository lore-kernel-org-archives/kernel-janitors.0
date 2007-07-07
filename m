From: Jan Engelhardt <jengelh@computergmbh.de>
Date: Sat, 07 Jul 2007 18:42:09 +0000
Subject: [KJ] Re: [PATCH] some kmalloc/memset ->kzalloc (tree wide)
Message-Id: <Pine.LNX.4.64.0707072037530.1536@fbirervta.pbzchgretzou.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <878x9ta320.fsf@wanadoo.fr>
In-Reply-To: <878x9ta320.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@lists.osdl.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


On Jul 6 2007 18:51, Yoann Padioleau wrote:
>Transform some calls to kmalloc/memset to a single kzalloc (or kcalloc).
>
>Here is a short excerpt of the semantic patch performing
>this transformation: 

Cool!

>--- a/Documentation/connector/cn_test.c
>+++ b/Documentation/connector/cn_test.c
>@@ -124,9 +124,8 @@ static void cn_test_timer_func(unsigned 
> 	struct cn_msg *m;
> 	char data[32];
> 
>-	m = kmalloc(sizeof(*m) + sizeof(data), GFP_ATOMIC);
>+	m = kzalloc(sizeof(*m) + sizeof(data), GFP_ATOMIC);
> 	if (m) {
>-		memset(m, 0, sizeof(*m) + sizeof(data));
> 
> 		memcpy(&m->id, &cn_test_id, sizeof(m->id));
> 		m->seq = cn_test_timer_counter;

Such empty lines (after memset) [c|s]hould also go.

>index e83f1db..deb7b6a 100644
>--- a/block/scsi_ioctl.c
>+++ b/block/scsi_ioctl.c
>@@ -405,11 +405,10 @@ int sg_scsi_ioctl(struct file *file, str
> 
> 	bytes = max(in_len, out_len);
> 	if (bytes) {
>-		buffer = kmalloc(bytes, q->bounce_gfp | GFP_USER| __GFP_NOWARN);
>+		buffer = kzalloc(bytes, q->bounce_gfp | GFP_USER| __GFP_NOWARN);
> 		if (!buffer)
> 			return -ENOMEM;
> 
>-		memset(buffer, 0, bytes);
> 	}

And in this case, empty line before memset.
(Either of - do not let remove empty lines in both directoriens around memset)

>@@ -1616,7 +1616,6 @@ #endif
> 		goto err_out_regions;
> 	}
> 
>-	memset(host, 0, sizeof(*host));
> 	host->pdev = pdev;
> 	host->flags = pci_dac ? FL_DAC : 0;
> 	spin_lock_init(&host->lock);

And in this case, no blank lines should be removed.


These are just suggestions. If it is too much work, leave it as-is. :)


	Jan
-- 
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
