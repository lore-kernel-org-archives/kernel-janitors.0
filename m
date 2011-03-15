From: Corentin Chary <corentin.chary@gmail.com>
Date: Tue, 15 Mar 2011 07:26:06 +0000
Subject: Re: [patch 2/2] asus-wmi: potential NULL dereference in show_call()
Message-Id: <AANLkTikPy_PM0yw06NNE5j6bBQbeX=Yz7ouPsurpKgrc@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110315070737.GT2008@bicker>
In-Reply-To: <20110315070737.GT2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 15, 2011 at 8:07 AM, Dan Carpenter <error27@gmail.com> wrote:
> In the earlier check we assumed that "obj" could be NULL.  I looked at
> some of the other places that call evaluate_object() and they check
> for NULL as well.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Can obj actually be NULL here?  Perhaps a better fix would be to remove
> the first check.

Yes I think it can.

> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index a038595..efc776c 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1343,7 +1343,7 @@ static int show_call(struct seq_file *m, void *data)
>        else
>                seq_printf(m, "%#x(%#x, %#x) = t:%d\n", asus->debug.method_id,
>                           asus->debug.dev_id, asus->debug.ctrl_param,
> -                          obj->type);
> +                          obj ? obj->type : -1);

Seems ok, I may change that later if we need to support more types.

Acked-by: Corentin Chary <corentin.chary@gmail.com>
-- 
Corentin Chary
http://xf.iksaif.net
