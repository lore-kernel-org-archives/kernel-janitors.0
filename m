From: Johannes Weiner <hannes@saeurebad.de>
Date: Tue, 01 Jul 2008 12:21:05 +0000
Subject: Re: [PATCH] fix mmap uninitialized warnings
Message-Id: <8763rp6bim.fsf@skyscraper.fehenstaub.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1214908567.31983.6.camel@jaswinder.satnam>
In-Reply-To: <1214908567.31983.6.camel@jaswinder.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

Jaswinder Singh <jaswinder@infradead.org> writes:

> Hello all,
>
> I am surprise why no body is solving these mmap warnings:
[...]
> here is the patch to solve above warnings.

You are, unfortunately, a bit late:

  http://lkml.org/lkml/2008/6/30/291

	Hannes
