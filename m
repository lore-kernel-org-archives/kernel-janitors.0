From: Vikas Chaudhary <vikas.chaudhary@qlogic.com>
Date: Wed, 13 Nov 2013 11:52:37 +0000
Subject: Re: [patch] [SCSI] qla4xxx: overflow in qla4xxx_set_chap_entry()
Message-Id: <3FC4AB8B47ECD546BCD4B361A64BEACD8C62AF37@avmb3.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113074811.GF25541@elgon.mountain>
In-Reply-To: <20131113074811.GF25541@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Adheer Chandravanshi <adheer.chandravanshi@qlogic.com>
Cc: Dept-Eng iSCSI Driver <Dept-iSCSIDriver@qlogic.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



-----Original Message-----
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wednesday, 13 November 2013 1:18 pm
To: Vikas <vikas.chaudhary@qlogic.com>, Adheer Chandravanshi
<adheer.chandravanshi@qlogic.com>
Cc: Dept-Eng iSCSI Driver <Dept-iSCSIDriver@qlogic.com>, "James E.J.
Bottomley" <JBottomley@parallels.com>, scsi <linux-scsi@vger.kernel.org>,
"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: [patch] [SCSI] qla4xxx: overflow in qla4xxx_set_chap_entry()

>We should cap the size of memcpy() because it comes from the network
>and can't be trusted.

This patch is on assumption that data is coming from network,
but in this case data come from application (iscsiadm) with correct length.


>
>Fixes: 26ffd7b45fe9 ('[SCSI] qla4xxx: Add support to set CHAP entries')
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>diff --git a/drivers/scsi/qla4xxx/ql4_os.c b/drivers/scsi/qla4xxx/ql4_os.c
>index a28d5e6..cf174a4 100644
>--- a/drivers/scsi/qla4xxx/ql4_os.c
>+++ b/drivers/scsi/qla4xxx/ql4_os.c
>@@ -802,6 +802,7 @@ static int qla4xxx_set_chap_entry(struct Scsi_Host
>*shost, void *data, int len)
> 	int type;
> 	int rem = len;
> 	int rc = 0;
>+	int size;
> 
> 	memset(&chap_rec, 0, sizeof(chap_rec));
> 
>@@ -816,12 +817,14 @@ static int qla4xxx_set_chap_entry(struct Scsi_Host
>*shost, void *data, int len)
> 			chap_rec.chap_type = param_info->value[0];
> 			break;
> 		case ISCSI_CHAP_PARAM_USERNAME:
>-			memcpy(chap_rec.username, param_info->value,
>-			       param_info->len);
>+			size = min_t(size_t, sizeof(chap_rec.username),
>+				     param_info->len);
>+			memcpy(chap_rec.username, param_info->value, size);
> 			break;
> 		case ISCSI_CHAP_PARAM_PASSWORD:
>-			memcpy(chap_rec.password, param_info->value,
>-			       param_info->len);
>+			size = min_t(size_t, sizeof(chap_rec.password),
>+				     param_info->len);
>+			memcpy(chap_rec.password, param_info->value, size);
> 			break;
> 		case ISCSI_CHAP_PARAM_PASSWORD_LEN:
> 			chap_rec.password_length = param_info->value[0];

