From: Ralf Baechle <ralf@linux-mips.org>
Date: Mon, 15 Oct 2012 08:56:48 +0000
Subject: Re: [mips:upstream 10/22] arch/mips/kernel/proc.c:75:3: warning: too many arguments for format
Message-Id: <20121015085648.GA15338@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121015015300.GE31881@yliu-dev.sh.intel.com>
In-Reply-To: <20121015015300.GE31881@yliu-dev.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

FWIW, I received two emails of identical content on this matter, one from
Yuanhan Liu <yuanhan.liu@intel.com>, one from Fengguang Wu <fengguang.wu@-
intel.com>.

  Ralf

On Mon, Oct 15, 2012 at 09:53:00AM +0800, Yuanhan Liu wrote:
> Date:   Mon, 15 Oct 2012 09:53:00 +0800
> From: Yuanhan Liu <yuanhan.liu@intel.com>
> To: "Steven J. Hill" <sjhill@mips.com>
> Cc: wfg@linux.intel.com, Yuanhan Liu <yuanhan.liu@intel.com>,
>  kernel-janitors@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
> Subject: [mips:upstream 10/22] arch/mips/kernel/proc.c:75:3: warning: too
>  many arguments for format
> Content-Type: text/plain; charset=us-ascii
> 
> Hi Steven,
> 
> FYI, there are new compile warnings show up in
> 
> tree:   git://git.linux-mips.org/pub/scm/ralf/upstream-linus.git upstream
> head:   35bafbee4b4732a2820bbd0ef141c8192ff29731
> commit: ee80f7c73dc1b1f0ba9f82079c9bd1c0d1aedef8 [10/22] MIPS: Add detection of DSP ASE Revision 2.
> config: mips-allyesconfig # make ARCH=mips 
> 
> All warnings:
> 
> arch/mips/kernel/proc.c: In function 'show_cpuinfo':
> arch/mips/kernel/proc.c:75:3: warning: too many arguments for format [-Wformat-extra-args]
> 
> ----
> I guess it's worthy to report it anyway, though this warning has
> been fixed by Ralf with a later commit: 981ef0de
> ----
> 
> vim +75 arch/mips/kernel/proc.c
> 
> 654f57bf David Daney    2008-09-23  59  	if (cpu_has_watch) {
> 654f57bf David Daney    2008-09-23  60  		seq_printf(m, "count: %d, address/irw mask: [",
> 03751e79 Steven J. Hill 2012-05-10  61  		      cpu_data[n].watch_reg_count);
> 654f57bf David Daney    2008-09-23  62  		for (i = 0; i < cpu_data[n].watch_reg_count; i++)
> 654f57bf David Daney    2008-09-23  63  			seq_printf(m, "%s0x%04x", i ? ", " : "" ,
> 03751e79 Steven J. Hill 2012-05-10  64  				cpu_data[n].watch_reg_masks[i]);
> 654f57bf David Daney    2008-09-23  65  		seq_printf(m, "]\n");
> 654f57bf David Daney    2008-09-23  66  	}
> e027802e Ralf Baechle   2005-08-16  67  	seq_printf(m, "ASEs implemented\t:%s%s%s%s%s%s\n",
> 4194318c Ralf Baechle   2005-05-05  68  		      cpu_has_mips16 ? " mips16" : "",
> 4194318c Ralf Baechle   2005-05-05  69  		      cpu_has_mdmx ? " mdmx" : "",
> 4194318c Ralf Baechle   2005-05-05  70  		      cpu_has_mips3d ? " mips3d" : "",
> e027802e Ralf Baechle   2005-08-16  71  		      cpu_has_smartmips ? " smartmips" : "",
> e027802e Ralf Baechle   2005-08-16  72  		      cpu_has_dsp ? " dsp" : "",
> ee80f7c7 Steven J. Hill 2012-08-03  73  		      cpu_has_dsp2 ? " dsp2" : "",
> e027802e Ralf Baechle   2005-08-16  74  		      cpu_has_mipsmt ? " mt" : ""
> e027802e Ralf Baechle   2005-08-16 @75  		);
> f6771dbb Ralf Baechle   2007-11-08  76  	seq_printf(m, "shadow register sets\t: %d\n",
> 03751e79 Steven J. Hill 2012-05-10  77  		      cpu_data[n].srsets);
> e77c32fe David Daney    2010-12-21  78  	seq_printf(m, "kscratch registers\t: %d\n",
> 03751e79 Steven J. Hill 2012-05-10  79  		      hweight8(cpu_data[n].kscratch_mask));
> 0ab7aefc Ralf Baechle   2007-03-02  80  	seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
> ^1da177e Linus Torvalds 2005-04-16  81  
> ^1da177e Linus Torvalds 2005-04-16  82  	sprintf(fmt, "VCE%%c exceptions\t\t: %s\n",
> 03751e79 Steven J. Hill 2012-05-10  83  		      cpu_has_vce ? "%u" : "not available");
> 
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation

  Ralf
