From: vignesh babu <vignesh.babu@wipro.com>
Date: Mon, 25 Jun 2007 12:33:19 +0000
Subject: [KJ] Re: [PATCH]is_power_of_2-ufs/super.c
Message-Id: <1182774079.4339.0.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181808559.2474.9.camel@merlin.linuxcoe.com>
	 <20070625121316.GA19544@saeurebad.de>
In-Reply-To: <20070625121316.GA19544@saeurebad.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Weiner <hannes-kernel@saeurebad.de>
Cc: daniel.pirkl@email.cz, dushistov@mail.ru, linux-kernel <linux-kernel@vger.kernel.org>, Kernel Janitors List <kernel-janitors@lists.osdl.org>

Thanks Hannes, Im on it...

On Mon, 2007-06-25 at 14:13 +0200, Johannes Weiner wrote:
> egrep -R '([a-zA-Z0-9_.>]+) *& *\(\1 *- *1\)' /usr/src/linux
-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
