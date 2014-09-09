From: Michal Nazarewicz <mina86@mina86.com>
Date: Tue, 09 Sep 2014 13:57:26 +0000
Subject: Re: [patch] usb: gadget: f_fs: signedness bug in __ffs_func_bind_do_descs()
Message-Id: <xa1tmwa828xl.fsf@mina86.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140909120609.GB19760@mwanda>
In-Reply-To: <20140909120609.GB19760@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 09 2014, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We need "idx" to be signed for the error handling to work.
>
> Fixes: 6d5c1c77bbf9 ('usb: gadget: f_fs: fix the redundant ep files problem')

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Michal Nazarewicz <mina86@mina86.com>

> ---
> Btw, there is a sparse warning:
>
> drivers/usb/gadget/function/f_fs.c:401:44: warning: Variable length array is used.
>
> The risk here is that the array would be too large.  I don't know the
> code well enough to say if it can be triggered, but from an outsider
> perspective it looks scary (security implications).  There should be a
> comment explaining why it can't be used to overflow the 8k stack.

n in that function can be at most 4 and usb_functionfs_event is 20 bytes
long so this takes at most 80 bytes.  Having said that, I can prepare
a patch that converts the array to one with compile-time size if
desired.

>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 0dc3552..7ad7137 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -2393,7 +2393,8 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
>  	struct usb_endpoint_descriptor *ds = (void *)desc;
>  	struct ffs_function *func = priv;
>  	struct ffs_ep *ffs_ep;
> -	unsigned ep_desc_id, idx;
> +	unsigned ep_desc_id;
> +	int idx;
>  	static const char *speed_names[] = { "full", "high", "super" };
>  
>  	if (type != FFS_DESCRIPTOR)

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michał “mina86” Nazarewicz    (o o)
ooo +--<mpn@google.com>--<xmpp:mina86@jabber.org>--ooO--(_)--Ooo--
