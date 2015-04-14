From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Apr 2015 06:58:17 +0000
Subject: Re: TODO list
Message-Id: <20150414065817.GC10964@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100714100136.GA3583@albatros>
In-Reply-To: <20100714100136.GA3583@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 13, 2015 at 03:42:38PM -0700, Ravi Kerur wrote:
> Thanks, The reason I didn't pick from drivers/staging is that I don't
> have necessary hardware to test the changes. Hence I chose something
> which can be tested without any restriction and get it done. Do you
> have any recommendations?

Most people send their staging patches without testing, honestly.

Otherwise just restrict yourself to drivers/.

Also checkpatch on its own is not really a justification for sending
patches outside of staging/.  The patch has to make the code better for
humans.

regards,
dan carpenter

