From: "Vorobiev Dmitri" <dmitri.vorobiev@movial.fi>
Date: Wed, 10 Dec 2008 22:18:42 +0000
Subject: Re: [PATCH 1/28] drivers/base/platform.c: Drop return value from
Message-Id: <53806.88.114.236.15.1228947522.squirrel@webmail.movial.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812101725540.21998@ask.diku.dk>
    <8bd0f97a0812100928l2c75d373n7eba5aa0cc3882fd@mail.gmail.com>
In-Reply-To: <8bd0f97a0812100928l2c75d373n7eba5aa0cc3882fd@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: Julia Lawall <julia@diku.dk>, dmitri.vorobiev@movial.fi, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> On Wed, Dec 10, 2008 at 11:26, Julia Lawall wrote:
>> The return value of the remove function of a driver structure, and thus
>> of
>> a platform_driver structure, is ultimately ignored, and is thus
>> unnecessary.  The goal of this patch is to make it possible to convert
>> the
>> platform_driver functions stored in the remove field such that they
>> return
>> void.  This patch introduces a temporary field remove_new with return
>> type
>> void into the platform_driver structure, and updates the only place that
>> the remove function is called to call the function in the remove_new
>> field,
>> if one is available.  The subsequent patches update some drivers to use
>> the
>> remove_new field.
>
> why bother with remove -> remove_new convention ?

Please see this email for the background:

http://lkml.org/lkml/2008/12/10/231

>  you'll get a
> warning in C about the assignment, but you wont get a build failure,

...unless you compile with -Werror, which frequently the case.

Dmitri
