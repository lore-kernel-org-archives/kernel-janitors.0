From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 30 Mar 2004 23:08:53 +0000
Subject: Re: [Kernel-janitors] cdrom_tocentry.cdte_datamode in
Message-Id: <20040330150853.5f0d5799.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87oeqmdpqx.fsf@orcus.priv.at>
In-Reply-To: <87oeqmdpqx.fsf@orcus.priv.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 24 Mar 2004 20:11:34 +0100 Robert Bihlmeyer wrote:

| Hi,
| 
| this field is broken and should not be used, two cdrom drivers put
| different things in it, most leave it alone. See also
| <URL:http://www.ussg.iu.edu/hypermail/linux/kernel/9905.3/0495.html>

cdrom/cm206.c, cdrom/sbpcd.c, and scsi/sr_ioctl.c all use it in
(seemingly) slightly different ways.

| I think this fact should at least be stated by a comment in cdrom.h,
| so nobody gets any funny ideas (been there, done that).
| 
| I'd prefer renaming the field so that apps relying on it will clearly
| break. They will anyway, e.g. when moving from SCSI cdrom to IDE.
| 
| Comments?

I don't know anything about that field, so I suggest that we ask
Jens for comments.... any comments about this, Jens?

Thanks,
--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
