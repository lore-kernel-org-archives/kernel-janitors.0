From: Shlomo Pongartz <shlomop@mellanox.com>
Date: Mon, 30 Jul 2012 14:58:48 +0000
Subject: Re: [for-next PATCH] IB/IPoIB: correct typo errors
Message-Id: <5016A128.50505@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1343641441-11942-1-git-send-email-shlomop@mellanox.com> <CAL1RGDUGo+VGumt4R9UPhFCK20q+YRb3OU05CoxbBxk=tDAupw@mail.gmail.com>
In-Reply-To: <CAL1RGDUGo+VGumt4R9UPhFCK20q+YRb3OU05CoxbBxk=tDAupw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org

On 7/30/2012 5:50 PM, Roland Dreier wrote:
> On Mon, Jul 30, 2012 at 2:44 AM, Shlomo Pongratz <shlomop@mellanox.com> wrote:
>> -                               lockdep_is_held(&ntbl->lock))) != NULL) {
>> +                               is_held(&ntbl->rwlock))) != NULL) {
> By the way, I assume this is a typo -- there is no plain "is_held()," is there?
>
>   - R.
>
You are absolutely right.
Sorry.
