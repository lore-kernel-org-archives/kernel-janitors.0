From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 12 Oct 2016 21:51:42 +0000
Subject: Re: [patch] libnvdimm, namespace: potential NULL deref on allocation error
Message-Id: <CAPcyv4hFVq7RQPsb_=7F3aahRqXKmUZSjeuKaG6yjtr9jDkDow@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012063429.GA13780@mwanda>
In-Reply-To: <20161012063429.GA13780@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-nvdimm <linux-nvdimm-y27Ovi1pjclAfugRpC6u6w@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Oct 11, 2016 at 11:34 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> If the kcalloc() fails then "devs" can be NULL and we dereference it
> checking "devs[i]".
>
> Fixes: 1b40e09a1232 ('libnvdimm: blk labels and namespace instantiation')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.
