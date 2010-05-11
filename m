From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 11 May 2010 18:08:54 +0000
Subject: Re: [PATCH] serial: bfin_sport_uart: Use resource size to fix
Message-Id: <AANLkTilzQO2a6OZFctMwEXiywCIlrfRfWyC4MyDQ4JJE@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273561823-4495-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1273561823-4495-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tobias Klauser <tklauser@distanz.ch>
Cc: gregkh@suse.de, linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 11, 2010 at 03:10, Tobias Klauser wrote:
> Use the resource_size function instead of manually calculating the
> resource size. This actually fixes an off-by-one error.

thanks !

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-mike
