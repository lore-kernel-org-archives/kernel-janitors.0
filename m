From: Hannes Eder <hannes@hanneseder.net>
Date: Tue, 24 Mar 2009 13:27:23 +0000
Subject: Re: x86 cpumask.h paravirt.h and sparse
Message-Id: <154e089b0903240627i5d9e5941r991ac0c0ba9f6a0f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49C8DBBA.90305@fastmail.fm>
In-Reply-To: <49C8DBBA.90305@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 24, 2009 at 2:10 PM, Jack Stone <jwjstone@fastmail.fm> wrote:
> Running the following commands generates a lot of sparse warnings:
>
> make distclean
> make allyesconfig
> make C=2
>
> These warnings are mostly symbol '______f' shadows an earlier one.
>
> I couldn't find anything mensioned in the archives for either this list
> or lkml.
>
> Are these a known problem and is anyone else working on it?

I disabled all the tracing options (in kernel hacking) to avoid all
this warnings and being able to focus on other stuff.

hth,
-Hannes
