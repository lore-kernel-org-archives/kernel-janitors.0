From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Wed, 08 Jan 2020 16:14:28 +0000
Subject: Re: Improving documentation for programming interfaces
Message-Id: <20200108161428.GA263696@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <350cd156-9080-24fe-c49e-96e758d3ca45@web.de>
 <20191220151945.GD59959@mit.edu>
 <17931ddd-76ec-d342-912c-faed6084e863@metux.net>
 <748b8572-a3b3-c084-e8e3-de420f53e468@web.de>
In-Reply-To: <748b8572-a3b3-c084-e8e3-de420f53e468@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Enrico Weigelt <lkml@metux.net>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Jan 08, 2020 at 01:40:45PM +0100, Markus Elfring wrote:
> 
> I propose to encode helpful information into macro calls as needed
> for the C programming language.

Perhaps it would be useful to for you to express what you are
proposing in the form of a patch?  That way people can see how
disruptive such changes might be, and how hard it might be to maintain
them.  That's on the "cost" side of the equation.

On the "benefits" side of the equation, is there are ways in which it
will directly benefit the kernel developers who will need to review
the patches and review the annotations, that can be demonstrated
immediately?  Not in some abstract way, or "when I my research work is
completed", but a very concrete way that will be obvious to those of
us who are still not completely convinced?

If the costs are very small, then the requirement for demonstrating
great benefits will also be small.  But if the costs are large (e.g.,
widespread renaming of huge numbers of functions, adding a lot of
extra complexity into code paths, use of silly/stupid names such as
"TransactionAwarePersistenceManagerFactoryProxy"), then need to show
benefits commensurate with such costs will also be great.

	 	      	   	      - Ted
