From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 09 Jul 2010 04:50:14 +0000
Subject: Re: [PATCH] staging/wlan-ng: reflects NL80211 API change
Message-Id: <AANLkTilxFI5ckhPu6dzkOT6JQIv8Lwwx7W4J9n0WbEso@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277684197.9983.7.camel@lenovo>
In-Reply-To: <1277684197.9983.7.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

>>
>> The problem is that the 802.11 netlink interface changed and the driver was not updated
>
> This needs to go through the wireless tree, care to send it there?  It
> just caused a build error in my tree if I was to take it :(
>
> thanks,
>
> greg k-h
>

Greg,

I look at wireless-next-2.6 and wireless-testing, none of them have
the same wlan-ng driver version that linux-next has.

I have seen this situation many times:

1- Someone change and API in a subsystem tree (wirless, pcmcia, block, etc).
2- linux-next tree pull these API changes.
3- The other trees doesn't have the last (or at least the same) driver
version that linux-next has.
4- Due the API change the drivers doesn't compile anymore. Both trees
compile cleanly separate but when they got merged, problems arises.

Because it is an API change, I'm told to send patches through
subsystem trees. But I can't do that because that trees doesn't have
the same driver version as linux-next has.

Please tell me how do I have to proceed in these situations. Or tell
me if there is a special integration tree for staging (besides
linux-next) that I can use to generate my patches against.

Thanks a lot for your help and best regards,

-----------------------------------------
Javier Martínez Canillas
+595 981 88 66 58
