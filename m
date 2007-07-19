From: "Thomas Surrel" <thomas.surrel@gmail.com>
Date: Thu, 19 Jul 2007 13:27:13 +0000
Subject: Re: netdev_priv()
Message-Id: <d858bca40707190627o245c033br5f4e486d25d1fa12@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
In-Reply-To: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>
> That's what my new semantic patch does. But maybe I am now too
> restrictive.

Your patch is indeed missing some needed changes. I had a look in
drivers/net/wireless only, and it appears that the following drivers
would need to be worked on as well:
airo
arlan
hostap
prism54
ray_cs
wavelan
wl3501

and I assume there are much more in the whole drivers/net/.

I'm not sure there is an easy way to do all the changes at once. I'm
going to make the changes manually in the remaining drivers, but if
there is a faster method, don't hesitate to stop me.

Best regards,

Thomas
