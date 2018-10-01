From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Oct 2018 06:56:36 +0000
Subject: [bug report] jump_label: Annotate entries that operate on __init code earlier
Message-Id: <20181001065636.GA22197@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ard Biesheuvel,

This is a semi-automatic email about new static checker warnings.

The patch 19483677684b: "jump_label: Annotate entries that operate on 
__init code earlier" from Sep 18, 2018, leads to the following Smatch 
complaint:

    kernel/jump_label.c:524 __jump_label_mod_update()
    error: we previously assumed 'm' could be null (see line 519)

kernel/jump_label.c
   518			m = mod->mod;
   519			if (!m)
                            ^^
Old code has check for NULL

   520				stop = __stop___jump_table;
   521			else
   522				stop = m->jump_entries + m->num_jump_entries;
   523			__jump_label_update(key, mod->entries, stop,
   524					    m->state = MODULE_STATE_COMING);
                                            ^^^^^^^^
New code adds unchecked dereference.

   525		}
   526	}

regards,
dan carpenter
