From: Sukanto Ghosh <sukanto.cse.iitb@gmail.com>
Date: Thu, 13 Jan 2011 04:05:10 +0000
Subject: Re: [PATCH] Removes warning related to use of uninitialized variable i
Message-Id: <AANLkTikx_zOZb_h_WNVpB837i_6ygNuVvApBnuAORv6D@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTi=h20J0XhFp2=iGH0WF-uZmWS0cv4018X=h5YBn@mail.gmail.com>
In-Reply-To: <AANLkTi=h20J0XhFp2=iGH0WF-uZmWS0cv4018X=h5YBn@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> If you just set it to NULL, how could it ever not be NULL, so why add
> this check?
>
Because, there is an assignment to i inside the for-each loop (hlist_for_each)
if it enters the loop.

> Also, no, this isn't correct, i is used in the hlist traversal.
>
Indeed it is being used but what if it doesn't enters the loop i.e. if
h->first is NULL
It is a different issue whether (h->first != NULL) is a precondition
to this function
but the compiler is warning because there exists a path to access of i->head
where it might be left uninitialized.

-- 
Regards,
Sukanto Ghosh
