From: Joe Perches <joe@perches.com>
Date: Sat, 13 Aug 2016 17:03:02 +0000
Subject: Re: [PATCH 2/2 v3] be2iscsi: Fix some error messages
Message-Id: <1471107782.3467.28.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4cd24bc3-7953-479a-1dbe-2aac9299ce13@wanadoo.fr>
	 <1471072824-1491-1-git-send-email-christophe.jaillet@wanadoo.fr>
	 <1471088144.3467.11.camel@perches.com>
	 <fdffed8e-d269-6519-437e-6f731dbb9c05@wanadoo.fr>
	 <1471106498.3467.19.camel@perches.com>
In-Reply-To: <1471106498.3467.19.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jayamohan.kallickal@avagotech.com, jejb@linux.vnet.ibm.com, ketan.mukadam@avagotech.com, sony.john@avagotech.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2016-08-13 at 09:41 -0700, Joe Perches wrote:
> On Sat, 2016-08-13 at 14:31 +0200, Christophe JAILLET wrote:
> > Le 13/08/2016 =E0 13:35, Joe Perches a =E9crit :
> > > > @@ -268,7 +268,7 @@ static int beiscsi_eh_abort(struct scsi_cmnd *s=
c)
> > > > =A0=A0				&nonemb_cmd.dma);
> > > > =A0=A0	if (nonemb_cmd.va =3D NULL) {
> > > > =A0=A0		beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_EH,
> > > > -			=A0=A0=A0=A0"BM_%d : Failed to allocate memory for"
> > > > +			=A0=A0=A0=A0"BM_%d : Failed to allocate memory for "
> > > > =A0=A0			=A0=A0=A0=A0"mgmt_invalidate_icds\n");

This is the first time I've looked at the beiscsi_log macro.

It sure is odd and undesirable.

It's _very_ not nice to have a format string take an implied
__LINE__ argument.

It'd be much more intelligible to take the first bit as a
separate string, concatenate it in the macro with "_%d: "
and __LINE__ (if that's really useful, I think it's not)
and emit that as the format.

Something like:

diff --git a/drivers/scsi/be2iscsi/be_main.h b/drivers/scsi/be2iscsi/be_mai=
n.h
index 30a4606..3f0fbbf 100644
--- a/drivers/scsi/be2iscsi/be_main.h
+++ b/drivers/scsi/be2iscsi/be_main.h
@@ -1084,11 +1084,12 @@ struct hwi_context_memory {
=A0#define __beiscsi_log(phba, level, fmt, arg...) \
=A0	shost_printk(level, phba->shost, fmt, __LINE__, ##arg)
=A0
-#define beiscsi_log(phba, level, mask, fmt, arg...) \
-do { \
-	uint32_t log_value =3D phba->attr_log_enable; \
-		if (((mask) & log_value) || (level[1] <=3D '3')) \
-			__beiscsi_log(phba, level, fmt, ##arg); \
-} while (0);
+#define beiscsi_log(phba, level, mask, prefix, fmt, ...)		\
+do {									\
+	uint32_t log_value =3D phba->attr_log_enable;			\
+	if (((mask) & log_value) || (level[1] <=3D '3'))			\
+		__beiscsi_log(phba, level, prefix "_%d: " fmt,		\
+			=A0=A0=A0=A0=A0=A0##__VA_ARGS__);				\
+} while (0)
=A0
=A0#endif

So these beiscsi_log uses become something like:

	beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_EH,
		=A0=A0=A0=A0"BM", "Failed to allocate memory for mgmt_invalidate_icds\n");

and the format and its arguments match.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
