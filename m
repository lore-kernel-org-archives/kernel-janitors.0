From: Krzysztof Halasa <khc@pm.waw.pl>
Date: Wed, 09 Dec 2009 16:41:04 +0000
Subject: Re: [PATCH] Coding style correction on some drivers that use Generic HDLC
Message-Id: <m33a3k9k2n.fsf@intrepid.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20091209143540.GA9620@vacuum.larces.uece.br>
In-Reply-To: <20091209143540.GA9620@vacuum.larces.uece.br> (Rudy Matela's
	message of "Wed, 9 Dec 2009 11:35:40 -0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rudy Matela <rudy.matela@gmail.com>
Cc: Jan Yenya Kasprzak <kas@fi.muni.cz>, trivial@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Rudy Matela <rudy.matela@gmail.com> writes:

> Added a space separating some if/switch/while keywords from the following
> parenthesis to conform to the CodingStyle.
>
> Signed-off-by: Rudy Matela <rudy.matela@gmail.com>
> ---
>
>  drivers/net/wan/cosa.c       |   10 +++++-----
>  drivers/net/wan/hdlc_cisco.c |    8 ++++----
>  drivers/net/wan/hdlc_x25.c   |    4 ++--

Ack from me, though a subset may already be in David Miller's tree.
Git merge can handle it without problems I guess.

Who is to commit this?
-- 
Krzysztof Halasa
