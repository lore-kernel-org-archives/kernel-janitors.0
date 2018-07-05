From: "Jasmin J." <jasmin@anw.at>
Date: Thu, 05 Jul 2018 07:32:28 +0000
Subject: Re: [PATCH] media: dvb_ca_en50221: off by one in dvb_ca_en50221_io_do_ioctl()
Message-Id: <6dda6fb1-fdce-df86-b0f9-a6c4bc522a2d@anw.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704094835.vzfqt44sqaga6aia@kili.mountain>
In-Reply-To: <20180704094835.vzfqt44sqaga6aia@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Dan!

I checked this and this is in since ages. Good catch!

I did a quick look to the other places where this is checked also
and they seem all ok.

Acked-by: Jasmin Jessich <jasmin@anw.at>

BR,
   Jasmin
