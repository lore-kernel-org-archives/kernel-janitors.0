From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Fri, 18 Dec 2020 12:35:58 +0000
Subject: Re: [PATCH] media: cec: fix trivial style warnings
Message-Id: <20201218123558.GA4088@fedora>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201218063117.GA80700@fedora>
 <20201218101630.GM2831@kadam>
In-Reply-To: <20201218101630.GM2831@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, sakari.ailus@linux.intel.com, gustavoars@kernel.org, linux-media@vger.kernel.org, trivial@kernel.org, kernel-janitors@vger.kernel.org

On Fri, Dec 18, 2020 at 01:16:30PM +0300, Dan Carpenter wrote:
> On Fri, Dec 18, 2020 at 01:31:17AM -0500, Nigel Christian wrote:
> > Comment has 'then' repeated twice. Let's clean it up.
> > Use unsigned int to maintain naming consistency.
> > 
> 
> Do you use a tool to find the double "then then"?
> 
> regards,
> dan carpenter
> 

Started working on nodejs script to run the 'checkpatch.pl -f'
on directories and filter the output by command line arg.
It goes in scripts/ and is run from the root of the kernel.
Let me know if there is any modification that can make it
more effective or specific filters.
------------------
'use strict'
// place this file in kernel 'scripts' directory
const pfs = require('fs').promises
const { spawn } = require('child_process')
const dir = process.argv[2]
const lvl = process.argv[3]
const path = `./${dir}`
const checkPatch = './scripts/checkpatch.pl -f'
const badInput = dir == undefined || dir == null || dir == ''
                || lvl == undefined || lvl == null || lvl == ''

/**
 * Check for valid command line arguments
 */
if(badInput) {
    console.log('Run checkpatch.pl on directories')
    console.log('Usage: node ./scripts/checkdirpatch <path/to/check>'
    + ' <LEVEL> (e.g. WARNING or ERROR)')
    process.exit(1)
} else {
    console.log(`Reading path ${path}...`)
}

/**
 * Async function for running checkpatch.pl on entire directory
 * We won't drill down any further from here and only check for
 * files at the current directory. Output is controlled via the 
 * log level which is passed as command line argument
 */
async function check() {
    const files = await pfs.readdir(path).then(v => v)
    files.forEach(async f => {
        const stat = await pfs.lstat(`${path}${f}`)
        if(stat.isFile()) {
            const child = spawn(`${checkPatch} ${path}${f} | grep -A1 ${lvl}`, {
                shell: true,
                stdio: ['pipe', 'inherit', 'ignore']
            })
        }
    })
}
check().catch(e => console.error(e))
--------------------------------------------

https://github.com/callmekurisu/kernel-dev/blob/main/checkdirpatch.js


Thanks, 

Nigel
