From: Michal Hocko <mhocko@suse.cz>
Date: Tue, 21 Aug 2012 14:22:39 +0000
Subject: Re: [memcg:since-3.5 41/99] (.text+0xa0998): undefined reference to `get_kernel_page'
Message-Id: <20120821142239.GG19797@dhcp22.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120819235924.GA25856@localhost>
In-Reply-To: <20120819235924.GA25856@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue 21-08-12 20:48:34, Wu Fengguang wrote:
> On Mon, Aug 20, 2012 at 06:43:00PM +0200, Michal Hocko wrote:
> > On Tue 21-08-12 00:28:13, Wu Fengguang wrote:
> > > On Mon, Aug 20, 2012 at 05:29:03PM +0200, Michal Hocko wrote:
> > [...]
> > > > compiles without any issues, right?
> > > 
> > > It have some other issues instead. You didn't receive emails about
> > > them because my system only complaint about "new" issues :-)
> > 
> > OK
> > > 
> > > In file included from /c/wfg/linux/arch/m32r/boot/compressed/misc.c:25:0:
> > > /c/wfg/linux/arch/m32r/boot/compressed/m32r_sio.c:11:13: warning: conflicting types for built-in function 'putc' [enabled by default]
> > >   MODPOST 111 modules
> > > ERROR: "memory_start" [fs/udf/udf.ko] undefined!
> > > ERROR: "memory_end" [fs/udf/udf.ko] undefined!
> > > ERROR: "memory_end" [drivers/scsi/sg.ko] undefined!
> > > ERROR: "memory_start" [drivers/scsi/sg.ko] undefined!
> > > ERROR: "memory_end" [drivers/i2c/i2c-dev.ko] undefined!
> > > ERROR: "memory_start" [drivers/i2c/i2c-dev.ko] undefined!
> > >   GZIP    arch/m32r/boot/compressed/vmlinux.bin.gz
> > > make[2]: *** [__modpost] Error 1
> > > make[1]: *** [modules] Error 2
> > > make[1]: *** Waiting for unfinished jobs....
> > >   LD      arch/m32r/boot/compressed/piggy.o
> > > /usr/local/gcc-4.6.3-nolibc/m32r-linux/bin/m32r-linux-ld: target elf32-m32r not found
> > 
> > I assume those are present in the mmotm as well.
> 
> I think so, too.
> 
> > > > > Btw, is it meaningful for me to test the bisectability of all the
> > > > > memcg branches? If not, you may give me a list or pattern for me to
> > > > > take care.
> > > > 
> > > > Well, I do not think that this kind of test makes sense for the tree
> > > > because fixups are always done as a separate commits to prevent from
> > > > rebasing. Andrew always folds the fixups into the final patch which is
> > > > sent to Linus or who ever should push it further.
> > > 
> > > Yeah the build script have taken care of these follow-up fixes:
> > > 
> > > has_akpm_fix()
> > > {       
> > >         [[ $branch = 'next/akpm' || $branch =~ 'memcg/' ]] || return 1
> > >         
> > >         [[ $(git_commit_subject $commit) =~ (fix|build|error|warning) ]] && return 0
> > >         [[ $(git_commit_changelog $commit) =~ (build|compile|gcc|sparse|error|warning) ]] && return 0
> > >         
> > >         next_commit=$(echo "$*" | sed -ne "$((iterated_commits+2))p")
> > >         [[ $(git_commit_subject $next_commit) =~ (fix|build|error|warning) ]] && return 0
> > >         [[ $(git_commit_changelog $next_commit) =~ (build|compile|gcc|sparse|error|warning) ]] && return 0
> > >         return 1
> > > }       
> > 
> > OK, but I still think that the tree is not constructed to be bisectable.
> > It's main purpose is the provide a common code base for -mm tree which
> > is easier to work with than linux-next. The compilation coverage is
> > really great and thanks a lot for doing that but I think that
> > bisectability testing is not needed.
> 
> Understand. I'll test the HEAD commits only for the memcg branches.

OK.  I think it is sufficient to test only the last since-X.Y branch
(X.Y comes from the last major release).
Thanks a lot for doing those tests!
> 
> Thanks,
> Fengguang

-- 
Michal Hocko
SUSE Labs
