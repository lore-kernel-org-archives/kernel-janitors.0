From: Benny Halevy <bhalevy@tonian.com>
Date: Wed, 30 Jan 2013 10:05:38 +0000
Subject: Re: [patch] [SCSI] libosd: check for kzalloc() failure
Message-Id: <CAEMWVhvzANfj7iM6CjeFUh_RSWmoOtVjRKYfQm8cATOTPshn6w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130130070602.GB12396@elgon.mountain>
In-Reply-To: <20130130070602.GB12396@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boaz Harrosh <bharrosh@panasas.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, osd-dev@open-osd.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 30, 2013 at 9:06 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> There wasn't any error handling for this kzalloc().
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/scsi/osd/osd_initiator.c b/drivers/scsi/osd/osd_initiator.c
> index c06b8e5..d8293f2 100644
> --- a/drivers/scsi/osd/osd_initiator.c
> +++ b/drivers/scsi/osd/osd_initiator.c
> @@ -144,6 +144,10 @@ static int _osd_get_print_system_info(struct osd_dev *od,
>         odi->osdname_len = get_attrs[a].len;
>         /* Avoid NULL for memcmp optimization 0-length is good enough */
>         odi->osdname = kzalloc(odi->osdname_len + 1, GFP_KERNEL);
> +       if (!odi->osdname) {
> +               ret = -ENOMEM;
> +               goto out;
> +       }

good catch!

Benny

>         if (odi->osdname_len)
>                 memcpy(odi->osdname, get_attrs[a].val_ptr, odi->osdname_len);
>         OSD_INFO("OSD_NAME               [%s]\n", odi->osdname);
