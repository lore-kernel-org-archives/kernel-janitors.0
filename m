From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 30 Jun 2020 20:25:31 +0000
Subject: Status of MAINTAINERS clean-up
Message-Id: <alpine.DEB.2.21.2006302214290.4085@felia>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

as Ralf Ramsauer and Pia Eichinger coincidently picked up and worked on 
the same MAINTAINERS clean-up task, Ralf requested to get a quick report 
on the state of the MAINTAINERS clean-up. Here you go.

I regularly run ./scripts/get_maintainers.pl ./scripts/get_maintainer.pl 
--self-test=patterns on Linus' tree and linux-next, address the issues and 
send out minor patches or simply report to the committers after a basic 
analysis.

Currently on v5.8-rc3, we have 17 warnings. On next-20200629, we have 16 
warnings with some overlap with the v5.8-rc3 warnings.

In more detail, here are all findings, put into categories and grouped 
when addressed with one patch.


WARNING ON v5.8-rc3, ADDRESSED IN next-20200629

./MAINTAINERS:3949: warning: no file matches	F:	Documentation/devicetree/bindings/rng/arm-cctrng.txt
./MAINTAINERS:5493: warning: no file matches	F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
./MAINTAINERS:14577: warning: no file matches	F:	Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
./MAINTAINERS:14578: warning: no file matches	F:	Documentation/devicetree/bindings/thermal/rcar-thermal.txt

No further action required.


WARNING ON v5.8-rc3 AND next-20200629, PATCH PENDING


[PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
./MAINTAINERS:1492: warning: no file matches	F:	devicetree/bindings/watchdog/arm-smc-wdt.yaml
    Pending Patch: https://lore.kernel.org/linux-watchdog/20200602052104.7795-1-lukas.bulwahn@gmail.com/


[PATCH v2 RESEND] MAINTAINERS: rectify MMP SUPPORT after moving cputype.h
./MAINTAINERS:11487: warning: no file matches	F:	linux/soc/mmp/
    Pending Patch: https://lore.kernel.org/lkml/20200506053431.7464-1-lukas.bulwahn@gmail.com/


[PATCH SECOND RESEND] MAINTAINERS: adjust entries to moving CEC platform drivers
./MAINTAINERS:2410: warning: no file matches	F:	drivers/media/platform/s5p-cec/
./MAINTAINERS:2555: warning: no file matches	F:	drivers/media/platform/tegra-cec/
./MAINTAINERS:3976: warning: no file matches	F:	drivers/media/platform/cec-gpio/
./MAINTAINERS:11155: warning: no file matches	F:	drivers/media/platform/meson/ao-cec-g12a.c
./MAINTAINERS:11156: warning: no file matches	F:	drivers/media/platform/meson/ao-cec.c
./MAINTAINERS:15266: warning: no file matches	F:	drivers/media/platform/seco-cec/seco-cec.c
./MAINTAINERS:15267: warning: no file matches	F:	drivers/media/platform/seco-cec/seco-cec.h
./MAINTAINERS:16305: warning: no file matches	F:	drivers/media/platform/sti/cec/
    Pending Patch: https://lore.kernel.org/lkml/20200525142946.8268-1-lukas.bulwahn@gmail.com/


WARNING ON v5.8-rc3 AND next-20200629, UNADDRESSED


./MAINTAINERS:11457: warning: no file matches	F:	drivers/*/*/*loongson2*
./MAINTAINERS:11467: warning: no file matches	F:	drivers/*/*/*loongson3*
./MAINTAINERS:11468: warning: no file matches	F:	drivers/*/*loongson3*

I had a first look, it is a special case, the committer wants to be 
informed on all loongson{2,3} files in drivers, but really in the last 
two years, there is only one directory that appeared in the repository 
and matched these patterns. So, one could probably just settle for naming 
the file that is in the repository right now. I did not send a patch yet, 
though.


WARNING ONLY ON next-20200629, PATCH ACCEPTED


[PATCH] MAINTAINERS: remove obsolete entry after file renaming
./MAINTAINERS:5024: warning: no file matches	F:	drivers/regulator/da903x.c
    Accepted Patch: https://lore.kernel.org/lkml/20200628180229.5068-1-lukas.bulwahn@gmail.com/

No further action required.


WARNING ONLY ON next-20200629, ADDRESSED DIFFERENTLY


./MAINTAINERS:6874: warning: no file matches	F:	Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
    Warning just appeared recently, warnings on 
Documentation/devicetree/bindings/ are usually addressed by devicetree 
maintainers before the pull request. So, no action required for now.


./MAINTAINERS:14057: warning: no file matches	F:	Documentation/networking/device_drivers/ethernet/qlogic/LICENSE.qla3xxx
    Appeared with a recent commit of moving files in Documentation.

    The real clean-up task for that file is described here: 
https://lore.kernel.org/linux-spdx/alpine.DEB.2.21.2006300644130.4919@felia/


SUMMARY

At the moment, I do not see too much potential for others to really  
contribute to this specific clean-up. Once the pending patches are picked 
up, which is tricky part, i.e., resubmitting and reminding, there have 
been so far not too many new warnings appearing, and the warnings on .txt 
to .yaml conversions in Documentation/devicetree/bindings/ are usually  
followed up by some devicetree maintainers and janitors.


Other MAINTAINERS clean up topics, I see on a longer task list are:

  - Go through the L: entries and address, "lists" that are 'email 
forwarders', but not (public) mailing lists with archives.
    Current idea is to either mark them special or make them M: or R: 
entries.

  - Assigning files to the "right" sections, not just having them lay 
around in THE REST. This will be lots of manual work and needs some kind 
of script-assisted approach, as many files are headers in include.

  - Documenting the properties for a clean MAINTAINERS file and the 
available checkers and tools

Contribution to those tasks are welcome, but they are by no means quick 
and easy fixes. They will need some thought and lots of persistence and 
patience to get done.


Lukas
