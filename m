From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 May 2014 07:35:42 +0000
Subject: Re: [Q] Sending a large patch
Message-Id: <20140514073542.GA22735@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAAvxhqBUO2HSgZjw=H7=Bd2gdw=JSjAs2Lx8E7rrGw8uqieZAg@mail.gmail.com>
In-Reply-To: <CAAvxhqBUO2HSgZjw=H7=Bd2gdw=JSjAs2Lx8E7rrGw8uqieZAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Wed, May 14, 2014 at 01:48:48AM +0100, Masaru Nomura wrote:
> Hi,
> 
> Can anyone help me with “how to properly deal with a large patch” please?
> 
> Now, I'm cleaning up a file and it has over 100 warnings of line over
> 80 character issues. As the problem seems to be the same, I may
> correct the bugs and send one commit. But I think it's a pain for
> reviewers to check all of them within one patch.
> 
> What do you think I could do?

100 is not bad.  Is this is all in one driver?  I say go ahead and send
it.

regards,
dan carpenter

