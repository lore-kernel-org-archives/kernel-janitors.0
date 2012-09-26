From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 26 Sep 2012 18:02:08 +0000
Subject: Re: [next:akpm 341/412] fs/hfsplus/attributes.c:64:5: error: too many arguments to function 'hfsplus
Message-Id: <20120926180208.GA28807@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926160710.GB14447@localhost>
In-Reply-To: <20120926160710.GB14447@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Vyacheslav,

On Wed, Sep 26, 2012 at 09:56:52PM +0400, Vyacheslav Dubeyko wrote:
> Hi Fengguang,
> 
> Sorry, I can't reproduce your issue.
> 
> I clone linux-next repository then "git checkout remotes/origin/akpm". I can compile kernel successfully with your .config files without any errors or warnings.
 
Then it looks like a bisectibility build error that's introduced in
de44b6109825809ac40c3f6e1b4be867bc6cec8e and then get fixed in some
later commit.

> I use gcc (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3.
> 
> What compiler do you use?
> Maybe do you have inconsistent repository state?

I use debian gcc 4.7.1 and do commit-by-commit tests.

Thanks,
Fengguang

> On Sep 26, 2012, at 8:07 PM, Fengguang Wu wrote:
> 
> > Hi Vyacheslav,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> > head:   dad0019944369f58c193c1991c39ffda7ff584d2
> > commit: de44b6109825809ac40c3f6e1b4be867bc6cec8e [341/412] hfsplus: add functionality of manipulating by records in attributes tree
> > config: x86_64-randconfig-s007 (attached as .config)
> > 
> > All error/warnings:
> > 
> > fs/hfsplus/attributes.c: In function 'hfsplus_attr_build_key':
> > fs/hfsplus/attributes.c:64:5: warning: passing argument 3 of 'hfsplus_asc2uni' makes pointer from integer without a cast [enabled by default]
> > In file included from fs/hfsplus/attributes.c:9:0:
> > fs/hfsplus/hfsplus_fs.h:448:5: note: expected 'const char *' but argument is of type 'int'
> > fs/hfsplus/attributes.c:64:5: warning: passing argument 4 of 'hfsplus_asc2uni' makes integer from pointer without a cast [enabled by default]
> > In file included from fs/hfsplus/attributes.c:9:0:
> > fs/hfsplus/hfsplus_fs.h:448:5: note: expected 'int' but argument is of type 'const char *'
> > fs/hfsplus/attributes.c:64:5: error: too many arguments to function 'hfsplus_asc2uni'
> > In file included from fs/hfsplus/attributes.c:9:0:
> > fs/hfsplus/hfsplus_fs.h:448:5: note: declared here
> > fs/hfsplus/attributes.c: In function 'hfsplus_find_attr':
> > fs/hfsplus/attributes.c:158:2: error: 'DBG_ATTR_MOD' undeclared (first use in this function)
> > fs/hfsplus/attributes.c:158:2: note: each undeclared identifier is reported only once for each function it appears in
> > fs/hfsplus/attributes.c:169:27: error: 'hfs_find_rec_by_key' undeclared (first use in this function)
> > fs/hfsplus/attributes.c:169:3: error: too many arguments to function 'hfsplus_brec_find'
> > In file included from fs/hfsplus/attributes.c:9:0:
> > fs/hfsplus/hfsplus_fs.h:373:5: note: declared here
> > fs/hfsplus/attributes.c:176:27: error: 'hfs_find_1st_rec_by_cnid' undeclared (first use in this function)
> > fs/hfsplus/attributes.c:176:3: error: too many arguments to function 'hfsplus_brec_find'
> > In file included from fs/hfsplus/attributes.c:9:0:
> > fs/hfsplus/hfsplus_fs.h:373:5: note: declared here
> > fs/hfsplus/attributes.c: In function 'hfsplus_create_attr':
> > fs/hfsplus/attributes.c:220:2: error: 'DBG_ATTR_MOD' undeclared (first use in this function)
> > fs/hfsplus/attributes.c:256:27: error: 'hfs_find_rec_by_key' undeclared (first use in this function)
> > fs/hfsplus/attributes.c:256:2: error: too many arguments to function 'hfsplus_brec_find'
> > In file included from fs/hfsplus/attributes.c:9:0:
> > fs/hfsplus/hfsplus_fs.h:373:5: note: declared here
> > fs/hfsplus/attributes.c:267:34: error: 'HFSPLUS_I_ATTR_DIRTY' undeclared (first use in this function)
> > fs/hfsplus/attributes.c: In function '__hfsplus_delete_attr':
> > fs/hfsplus/attributes.c:310:34: error: 'HFSPLUS_I_ATTR_DIRTY' undeclared (first use in this function)
> > fs/hfsplus/attributes.c: In function 'hfsplus_delete_attr':
> > fs/hfsplus/attributes.c:320:2: error: 'DBG_ATTR_MOD' undeclared (first use in this function)
> > fs/hfsplus/attributes.c:343:27: error: 'hfs_find_rec_by_key' undeclared (first use in this function)
> > fs/hfsplus/attributes.c:343:2: error: too many arguments to function 'hfsplus_brec_find'
> > In file included from fs/hfsplus/attributes.c:9:0:
> > fs/hfsplus/hfsplus_fs.h:373:5: note: declared here
> > fs/hfsplus/attributes.c: In function 'hfsplus_delete_all_attrs':
> > fs/hfsplus/attributes.c:361:2: error: 'DBG_ATTR_MOD' undeclared (first use in this function)
> > 
> > vim +64 fs/hfsplus/attributes.c
> >    58			if (len > HFSPLUS_ATTR_MAX_STRLEN) {
> >    59				printk(KERN_ERR "hfs: invalid xattr name's length\n");
> >    60				return -EINVAL;
> >    61			}
> >    62			hfsplus_asc2uni(sb,
> >    63					(struct hfsplus_unistr *)&key->attr.key_name,
> >> 64					HFSPLUS_ATTR_MAX_STRLEN, name, len);
> >    65			len = be16_to_cpu(key->attr.key_name.length);
> >    66		} else {
> >    67			key->attr.key_name.length = 0;
> > 
> > ---
> > 0-DAY kernel build testing backend         Open Source Technology Centre
> > Fengguang Wu, Yuanhan Liu                              Intel Corporation
> > <.config.txt>
