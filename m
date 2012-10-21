From: Jean Delvare <khali@linux-fr.org>
Date: Sun, 21 Oct 2012 14:32:06 +0000
Subject: Re: [jdelvare-staging:i2c-for-linus 9/15]   drivers/input/keyboard/adp5588-keys.c:52:19: error: fiel
Message-Id: <20121021163206.6eef3abb@endymion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thanks for the fast reply Stephen.

On Mon, 22 Oct 2012 01:19:11 +1100, Stephen Rothwell wrote:
> On Sun, 21 Oct 2012 14:16:59 +0200 Jean Delvare <khali@linux-fr.org> wrote:
> > It turns out that linux-next no longer seems to include my i2c patches.
> > Stephen, can you please check?
> 
> I haven't changed anything about the i2c tree.  I fetch a quilt series
> from http://khali.linux-fr.org/devel/linux-3/jdelvare-i2c/ .  The last
> change I have seen was on October 16 (my time) and the series contained
> only one patch for linux-next: i2c-move-i2c-stub.patch .
> 
> I just refetched it and the only change was to now be based on v3.7-rc2.
> Do you have your NEXT_PATCHES_START/END markers in the right place?

Doh, you're right, markers were incorrectly placed in my series file
and this is why newest patches ended up missing from your tree. Thanks
for pointing me to the right direction and sorry for the noise. I'll
hack my scripts to emit a warning when this happens, sometimes I do it
on purpose but this is a rare case.

-- 
Jean Delvare
