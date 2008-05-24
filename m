From: Arjan van de Ven <arjan@infradead.org>
Date: Sat, 24 May 2008 23:46:15 +0000
Subject: Re: some numbers on macros
Message-Id: <20080524164615.0ed80f85@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200805241748.19607.m.kozlowski@tuxland.pl>
	<20080524093350.60e6dc8d@infradead.org>
	<20080524185201.GZ2638@parisc-linux.org>
	<200805250141.09195.m.kozlowski@tuxland.pl>
In-Reply-To: <200805250141.09195.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: Matthew Wilcox <matthew@wil.cx>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 25 May 2008 01:41:09 +0200
Mariusz Kozlowski <m.kozlowski@tuxland.pl> wrote:
> 
> Interesting part would be to write a 'parser' that actually sees the
> context and understands cpp directives, that could 'walk' the tree.


you could approach it from the opposite angle... I mean, lxr.linux.no
already has all this data in some database.. maybe you can turn it into
a set of database queries ;)
