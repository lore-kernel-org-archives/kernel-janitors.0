From: walter harms <wharms@bfs.de>
Date: Tue, 07 Sep 2010 07:16:46 +0000
Subject: Re: [PATCH 09/14] staging: westbridge: improve error path
Message-Id: <4C85E6DE.3020409@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711573-7460-1-git-send-email-segooon@gmail.com> <4C849D78.9040202@bfs.de> <20100906203330.GE5162@suse.de>
In-Reply-To: <20100906203330.GE5162@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@suse.de>
Cc: Kulikov Vasiliy <segooon@gmail.com>, kernel-janitors@vger.kernel.org, David Cross <david.cross@cypress.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org



Greg KH schrieb:
> On Mon, Sep 06, 2010 at 09:51:20AM +0200, walter harms wrote:
>> the indention should be fixed also.
> 
> Yes, the indentation for the whole file should be fixed, but that's not
> what this patch was doing.
> 
> Remember, a patch should only do one thing at a time.
> 

that is true,
but in this special case i nearly missed the #if because it is so hidden
in the code. IMHO that is enough for an exception.

re,
 wh

