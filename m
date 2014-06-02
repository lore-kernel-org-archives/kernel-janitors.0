From: Benoit Taine <benoit.taine@lip6.fr>
Date: Mon, 02 Jun 2014 11:28:18 +0000
Subject: Re: [PATCH 2/2] lpc_eth: Use resource_size instead of computation
Message-Id: <20140602112818.GB3625@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401290047-30005-3-git-send-email-benoit.taine@lip6.fr>
In-Reply-To: <1401290047-30005-3-git-send-email-benoit.taine@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 02/06/2014 09:45, Walter Harms wrote:
> Just for my curiosity: what does %pR mean ? (%p is ok, what is R ?)

According to Documentation/printk-formats.txt, it prints struct
resources with a decoded flags member:
  [mem 0x60000000-0x6fffffff pref]
  or
  [mem 0x0000000060000000-0x000000006fffffff pref]

--=20
Beno=C3=AEt Taine
Master cycle intern
Regal Team. LIP6
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
