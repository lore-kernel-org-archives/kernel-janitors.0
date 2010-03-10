From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Mar 2010 10:14:53 +0000
Subject: Re: smatch_scripts/whitespace_only.sh
Message-Id: <Pine.LNX.4.64.1003101113330.24684@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100310101224.GC6321@bicker>
In-Reply-To: <20100310101224.GC6321@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: linux-kernel@vger.kernel.org, gregkh@suse.de, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org

On Wed, 10 Mar 2010, Dan Carpenter wrote:

> I wrote a script to check that a patch only changes white space.
> It compiles the files before and after the patch is applied and 
> verifies that they are the same.
> 
> You'll need to compile smatch:
> 	git pull git://repo.or.cz/smatch.git
> 	make
> 	cd /path/to/kernel/src/
> 	/path/to/smatch_scripts/whitespace_only.sh <patch>
> 
> Adding or removing parenthesis and curly braces counts as a code 
> change.  Changes to comments, #if 0, white space changes do not.
> 
> You can fix a lot of style violations if you limit yourself to 
> adding and removing tabs, spaces and new lines.  Then the next 
> patch could remove unneeded parenthesis.  It would be easier to
> audit that way instead of everything mixed together.
> 
> regards,
> dan carpenter
> 
> PS.  I feel really bad slagging the newbies trying to help.  
> Could we fix checkpatch.pl to not complain about line lengths?

I hope not...  Are newbies really put off by having to add a newline here 
and there?

julia

> Also could we tell them to stay in staging where no one cares
> about git blame?
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
