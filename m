From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Feb 2019 13:34:36 +0000
Subject: Re: [PATCH] cifs: Clean up an error code in cifs_root_iget()
Message-Id: <20190228133435.GB9806@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190228052659.GA3253@kadam>
 <CAH2r5ms1+5Kj_qmWx3oww7Af_rfiCSBbkGos_gqieqH7jW98BQ@mail.gmail.com>
In-Reply-To: <CAH2r5ms1+5Kj_qmWx3oww7Af_rfiCSBbkGos_gqieqH7jW98BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, samba-technical <samba-technical@lists.samba.org>

On Wed, Feb 27, 2019 at 11:44:14PM -0600, Steve French wrote:
> Won't that change behavior and cause the success case (server returned
> 0, and does support POSIX and &inode pointer is ok) to now return
> -EINVAL.
> 

You're right.  I'm really sorry.  I don't know why I misread the code...

Also looking at it now, this was a false positive in Smatch.  I have
been working on that code in the past couple days and I don't have the
warning in my latest build.

regards,
dan carpenter
