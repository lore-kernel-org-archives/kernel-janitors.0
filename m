From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Nov 2018 05:44:07 +0000
Subject: [bug report] rapidio: add RapidIO channelized messaging driver
Message-Id: <20181101054407.ehknokufvivz52s3@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Alexandre Bounine,

This is a semi-automatic email about new static checker warnings.

The patch b6e8d4aa1110: "rapidio: add RapidIO channelized messaging 
driver" from Aug 2, 2016, leads to the following Smatch complaint:

    drivers/rapidio/rio_cm.c:1220 riocm_ch_listen()
     error: we previously assumed 'ch' could be null (see line 1218)

drivers/rapidio/rio_cm.c
  1217		ch = riocm_get_channel(ch_id);
  1218		if (!ch || !riocm_cmp_exch(ch, RIO_CM_CHAN_BOUND, RIO_CM_LISTEN))
                    ^^^
Check.

  1219			ret = -EINVAL;
  1220		riocm_put_channel(ch);
                                  ^^
Unchecked dereference.

  1221		return ret;
  1222	}

regards,
dan carpenter
