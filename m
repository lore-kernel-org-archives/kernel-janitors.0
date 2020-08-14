From: Denis Efremov <efremov@linux.com>
Date: Fri, 14 Aug 2020 08:50:35 +0000
Subject: Re: [PATCH] coccinelle: api: add sprintf() support to device_attr_show
Message-Id: <8e76e81f-970b-b1f7-840d-10506dc3311a@linux.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ed9a8046-4c21-e849-f68b-9e08991b701d@web.de>
In-Reply-To: <ed9a8046-4c21-e849-f68b-9e08991b701d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Julia Lawall <julia.lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>, linux-kernel@vger.kernel.org

Hi,

Markus, I think that CCing new people and spam them with mails they
are obviously not interested in doesn't bring an additional value to
the discussion. linux-kernel and cocci mailing lists are enough
in my opinion. This also will allow us to keep "threaded" mail
order.

On 8/14/20 11:30 AM, Markus Elfring wrote:
>> Interesting enough that with this patch coccinelle starts to skip
>> patch generation in some cases. For example, it skips patch for
>> drivers/base/core.c This is an unexpected result for me.
> 
> Would you like to point questionable differences for such patch hunks out?

Without this patch the script generates:
$ spatch -D patch --no-includes --include-headers --cocci-file scripts/coccinelle/api/device_attr_show.cocci drivers/base/core.c
--- drivers/base/core.c
+++ /tmp/cocci-output-63510-2f17ff-core.c
@@ -1713,7 +1713,7 @@ ssize_t device_show_ulong(struct device
char *buf)
{
struct dev_ext_attribute *ea = to_ext_attr(attr);
-       return snprintf(buf, PAGE_SIZE, "%lx\n", *(unsigned long *)(ea->var));
+       return scnprintf(buf, PAGE_SIZE, "%lx\n", *(unsigned long *)(ea->var));
}
EXPORT_SYMBOL_GPL(device_show_ulong);

@@ -1743,7 +1743,7 @@ ssize_t device_show_int(struct device *d
{
struct dev_ext_attribute *ea = to_ext_attr(attr);

-       return snprintf(buf, PAGE_SIZE, "%d\n", *(int *)(ea->var));
+       return scnprintf(buf, PAGE_SIZE, "%d\n", *(int *)(ea->var));
}
EXPORT_SYMBOL_GPL(device_show_int);

@@ -1764,7 +1764,7 @@ ssize_t device_show_bool(struct device *
{
struct dev_ext_attribute *ea = to_ext_attr(attr);

-       return snprintf(buf, PAGE_SIZE, "%d\n", *(bool *)(ea->var));
+       return scnprintf(buf, PAGE_SIZE, "%d\n", *(bool *)(ea->var));
}
EXPORT_SYMBOL_GPL(device_show_bool);

With this patch it generates nothing. I would expect spatch to generate
a different patch with sprintf instead of scnprintf, because I think 
... is enough to match "*(int *)(ea->var)". Even if it can't match sprintf
pattern it should fallback to scnprintf pattern.

> You propose to use a nested SmPL disjunction for desired adjustments.
> I suggest to start a corresponding case distinction behind
> the key word “return” instead of repeating it three times.

It doesn't work.

Thanks,
Denis
