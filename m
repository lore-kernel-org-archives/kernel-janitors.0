From: Tomi Valkeinen <tomi.valkeinen@nokia.com>
Date: Fri, 21 May 2010 08:37:32 +0000
Subject: Re: [PATCH] OMAP: DSS2: storage class should be before const
Message-Id: <1274431052.4246.88.camel@tubuntu.research.nokia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1274368372-4043-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1274368372-4043-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hi,

On Thu, 2010-05-20 at 17:12 +0200, ext Tobias Klauser wrote:
> The C99 specification states in section 6.11.5:
> 
> The placement of a storage-class specifier other than at the beginning
> of the declaration specifiers in a declaration is an obsolescent
> feature.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Thanks! Applied to omap-dss tree.

 Tomi


