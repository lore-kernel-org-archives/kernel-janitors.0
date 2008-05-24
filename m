From: Arjan van de Ven <arjan@infradead.org>
Date: Sat, 24 May 2008 16:33:50 +0000
Subject: Re: some numbers on macros
Message-Id: <20080524093350.60e6dc8d@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200805241748.19607.m.kozlowski@tuxland.pl>
In-Reply-To: <200805241748.19607.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 24 May 2008 17:48:19 +0200
Mariusz Kozlowski <m.kozlowski@tuxland.pl> wrote:

> Hello,
> 
> 	I wrote a rather dumb script to see some numbers on macros I
> was interested in. The script basically parses *.c file, finds macro
> definitions and counts how many times each macro was used in this
> source file. The script doesn't see any context so it can produce
> false positives - that is one of the reasons it doesn't look into
> header files - it's simply too dumb.
> 
> The macros I was interested in were these which are:
> - defined and unused
> - defined and used only once
> - defined more than once
> 
> I dont want to start another cleanup-patches-storm so first I'd like
> to know if this excersise is worth it as unused macros do not do much
> harm.
> 
> Would such patches be accepted?

An unused define/macro that was declared in a .c file isn't very
interesting to be honest; that tends to be helper macros for the
developer and removing those is just counter productive.

unused macros in common header files are an indication of stale APIs
otoh.. and might be of some interest. (Same for static inline in
headers)
