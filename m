From: Domen Puncer <domen@coderock.org>
Date: Sat, 17 Jan 2004 16:04:40 +0000
Subject: [Kernel-janitors] [rfc] a lot of unused CONFIG_*
Message-Id: <200401171704.40353.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.

# wc -l CONFIG_defined_but_not_used CONFIG_not_defined_but_used
    116 CONFIG_defined_but_not_used
    635 CONFIG_not_defined_but_used

This is a lot!

I didn't strip out "*_MODULE" (don't know if they're automagicaly
generated and it doesn't make much difference).

So... am I wrong about my script, or do we have A LOT of work to do?

Any suggestions, how to fix this? (grepping for every symbol, and
replacing it takes too much time).


Upper 2 files were generated from following commands in bash.
Sorry, not very readable, i know.
# these executed on kernel source
# find files that use *CONFIG_*
find | egrep '\.[chS]$' | xargs egrep 'CONFIG_[A-Z0-9a-z]*' | sed 's/.*CONFIG_/CONFIG_/g' | sed 's/[^A-Z0-9a-z_].*//' | sort | uniq | tee ../CONFIGs_in_source

# find CONFIG_* that are defined in Kconfig files
find | grep Kconfig | xargs egrep '^config.*[A-Z0-9a-z_]+$' | sed 's/.*config[^A-Z0-9a-z_]*/CONFIG_/g' | sort | uniq | tee ../config

# find *CONFIG_* defined in sources
find | egrep '\.[chS]$' | xargs egrep '#define.*CONFIG' | sed 's/.*CONFIG_/CONFIG_/g' | sed 's/[^A-Z0-9a-z_].*//' | sort | uniq | tee ../CONFIGs_defined

# these on ".." relative to kernel source
# used (or defined) in sources, but not defined in Kconfig
diff CONFIGs_in_source config | egrep '^<' | cut -f2 -d\  > CONFIGs_not_in_config

# filename says it all
diff CONFIGs_not_in_config CONFIGs_defined | grep '<' | cut -f2 -d\  > CONFIG_not_defined_but_used

# see filename
diff CONFIGs_not_in_config CONFIGs_defined | grep '>' | cut -f2 -d\  > CONFIG_defined_but_not_used

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
