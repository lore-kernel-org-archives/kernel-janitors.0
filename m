From: Roland Dreier <roland@kernel.org>
Date: Mon, 30 Jul 2012 14:50:25 +0000
Subject: Re: [for-next PATCH] IB/IPoIB: correct typo errors
Message-Id: <CAL1RGDUGo+VGumt4R9UPhFCK20q+YRb3OU05CoxbBxk=tDAupw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1343641441-11942-1-git-send-email-shlomop@mellanox.com>
In-Reply-To: <1343641441-11942-1-git-send-email-shlomop-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shlomo Pongratz <shlomop-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org

On Mon, Jul 30, 2012 at 2:44 AM, Shlomo Pongratz <shlomop@mellanox.com> wrote:
> -                               lockdep_is_held(&ntbl->lock))) != NULL) {
> +                               is_held(&ntbl->rwlock))) != NULL) {

By the way, I assume this is a typo -- there is no plain "is_held()," is there?

 - R.
