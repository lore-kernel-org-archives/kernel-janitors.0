From: "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Fri, 20 Dec 2019 15:19:45 +0000
Subject: Re: Improving documentation for programming interfaces
Message-Id: <20191220151945.GD59959@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <350cd156-9080-24fe-c49e-96e758d3ca45@web.de>
In-Reply-To: <350cd156-9080-24fe-c49e-96e758d3ca45@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Dec 20, 2019 at 02:30:10PM +0100, Markus Elfring wrote:
> Linux supports some programming interfaces. Several functions are provided
> as usual. Their application documentation is an ongoing development challenge.
> 
> Now I would like to clarify possibilities for the specification of desired
> information together with data types besides properties which are handled by
> the programming language “C” so far.
> It seems that no customised attributes are supported at the moment.
> Thus I imagine to specify helpful annotations as macros.
> 
> Example:
> Some functions allocate resources to which a pointer (or handle) is returned.
> I would find it nice then if such a pointer would contain also the background
> information by which functions the resource should usually be released.
> 
> Can it become easier to determine such data?

Markus,

It's unclear to me what you are requesting/proposing?  Can you be a
bit more concrete?

						- Ted
