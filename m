From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Sep 2012 08:58:02 +0000
Subject: Re: [PATCH] Fix misspellings of "whether" in comments.
Message-Id: <20120920085802.GZ4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348105682-25196-3-git-send-email-adam.buchbinder@gmail.com>
In-Reply-To: <1348105682-25196-3-git-send-email-adam.buchbinder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

To be honest, I have no idea what's going on in the trivial tree
these days or what the rules are there.

But my instinct says that this would be better broken up into per
subsystem patches and sent through the normal trees.  Patches that
touch a ton of files like this are hard to merge all at once.
Someone is going to be changing some files and you'll get conflicts.

regards,
dan carpenter

