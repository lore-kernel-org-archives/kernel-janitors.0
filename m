From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 May 2015 09:01:26 +0000
Subject: Re: some advices
Message-Id: <20150505090126.GS14154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAPmfwEkA6GZLtmNHno3OYOG31cbDx_5kZpqho4f+KEb75XKGzg@mail.gmail.com>
In-Reply-To: <CAPmfwEkA6GZLtmNHno3OYOG31cbDx_5kZpqho4f+KEb75XKGzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 05, 2015 at 12:21:53AM -0300, Adir Kuhn wrote:
> Hi everybody, I'm quite new here and I want to be a kernel developer
> so where I can start? I dowloaded the linux kernel source and followed
> the tips for the first patch on the kernelnewbies but sometimes these
> patches are not acepted because is too simple (just cleaning code
> style). So there is something else that I can study or some trivial
> bug to fix to feel me more confident on linux development?
> 

If you send code style changes to staging they will accept anything.

But if you want to learn then stay on the same driver and just focus on
sending patches for it until you understand it completely.

You could also fix GCC warnings, cppcheck, or clang stuff.

regards,
dan carpentr

