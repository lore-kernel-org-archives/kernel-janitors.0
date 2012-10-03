From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Oct 2012 13:29:13 +0000
Subject: [uapi:uapi-split 44/75] include/linux/projid.h:17:30: error: storage class specified for parameter '
Message-Id: <20121003132913.GA4731@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

FYI, kernel build failed on

tree:   git://git.infradead.org/users/dhowells/linux-headers.git uapi-split
head:   72541c7f48c3dcd7b9cbc3c56a804f7901c2c3dc
commit: 81be833cfcaa1b0186bc21f97ee9e65dc71506d5 [44/75] UAPI: (Scripted) Disintegrate include/asm-generic
config: openrisc-or1ksim_defconfig

I also see lots of errors when compiling its HEAD commit. linus/master builds fine.

All error/warnings:

include/linux/seq_file.h:35:1: warning: empty declaration
include/linux/seq_file.h:53:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/seq_file.h:73:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/seq_file.h:92:1: error: expected declaration specifiers before '__attribute__'
include/linux/seq_file.h:93:1: error: expected declaration specifiers before '__attribute__'
include/linux/seq_file.h:102:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/seq_file.h:107:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/seq_file.h:116:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/seq_file.h:121:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/seq_file.h:136:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/seq_file.h:150:26: error: storage class specified for parameter 'seq_list_start'
include/linux/seq_file.h:152:26: error: storage class specified for parameter 'seq_list_start_head'
include/linux/seq_file.h:154:26: error: storage class specified for parameter 'seq_list_next'
include/linux/seq_file.h:161:27: error: storage class specified for parameter 'seq_hlist_start'
include/linux/seq_file.h:163:27: error: storage class specified for parameter 'seq_hlist_start_head'
include/linux/seq_file.h:165:27: error: storage class specified for parameter 'seq_hlist_next'
include/linux/seq_file.h:168:27: error: storage class specified for parameter 'seq_hlist_start_rcu'
include/linux/seq_file.h:170:27: error: storage class specified for parameter 'seq_hlist_start_head_rcu'
include/linux/seq_file.h:172:27: error: storage class specified for parameter 'seq_hlist_next_rcu'
In file included from include/linux/ftrace_event.h:4:0,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/open.c:26:
include/linux/ring_buffer.h:8:1: warning: empty declaration
include/linux/ring_buffer.h:9:1: warning: empty declaration
include/linux/ring_buffer.h:14:1: warning: empty declaration
include/linux/ring_buffer.h:54:1: warning: empty declaration
include/linux/ring_buffer.h:146:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ring_buffer.h:184:1: warning: empty declaration
include/linux/ring_buffer.h:189:1: warning: empty declaration
In file included from include/linux/ftrace_event.h:5:0,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/open.c:26:
include/linux/trace_seq.h:13:1: warning: empty declaration
include/linux/trace_seq.h:22:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/trace_seq.h:51:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/trace_seq.h:56:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/trace_seq.h:61:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/trace_seq.h:66:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/trace_seq.h:70:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/trace_seq.h:74:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/trace_seq.h:79:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/trace_seq.h:84:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/trace_seq.h:88:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/trace_seq.h:92:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
In file included from include/linux/ftrace_event.h:8:0,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/open.c:26:
include/linux/perf_event.h:28:1: warning: empty declaration
include/linux/perf_event.h:44:1: warning: empty declaration
include/linux/perf_event.h:69:1: warning: empty declaration
include/linux/perf_event.h:81:1: warning: empty declaration
include/linux/perf_event.h:89:1: warning: empty declaration
include/linux/perf_event.h:102:1: warning: empty declaration
include/linux/perf_event.h:120:1: warning: empty declaration
include/linux/perf_event.h:149:1: warning: empty declaration
include/linux/perf_event.h:170:1: warning: empty declaration
include/linux/perf_event.h:196:1: warning: empty declaration
include/linux/perf_event.h:214:1: warning: empty declaration
include/linux/perf_event.h:320:1: warning: empty declaration
include/linux/perf_event.h:327:1: warning: empty declaration
include/linux/perf_event.h:457:1: warning: empty declaration
include/linux/perf_event.h:463:1: warning: empty declaration
include/linux/perf_event.h:599:1: warning: empty declaration
include/linux/perf_event.h:626:1: warning: empty declaration
In file included from include/linux/pid_namespace.h:8:0,
                 from include/linux/perf_event.h:643,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/open.c:26:
include/linux/nsproxy.h:7:1: warning: empty declaration
include/linux/nsproxy.h:8:1: warning: empty declaration
include/linux/nsproxy.h:9:1: warning: empty declaration
include/linux/nsproxy.h:10:1: warning: empty declaration
include/linux/nsproxy.h:11:1: warning: empty declaration
include/linux/nsproxy.h:25:1: warning: empty declaration
include/linux/nsproxy.h:33:23: error: storage class specified for parameter 'init_nsproxy'
include/linux/nsproxy.h:61:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/nsproxy.h:71:12: error: section attribute not allowed for 'nsproxy_cache_init'
include/linux/nsproxy.h:71:1: warning: '__cold__' attribute ignored
include/linux/nsproxy.h:71:12: error: 'no_instrument_function' attribute applies only to functions
include/linux/nsproxy.h:74:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/nsproxy.h:81:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
In file included from include/linux/perf_event.h:643:0,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/open.c:26:
include/linux/pid_namespace.h:11:1: warning: empty declaration
include/linux/pid_namespace.h:18:1: warning: empty declaration
include/linux/pid_namespace.h:20:1: warning: empty declaration
include/linux/pid_namespace.h:39:29: error: storage class specified for parameter 'init_pid_ns'
include/linux/pid_namespace.h:64:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/pid_namespace.h:70:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/pid_namespace.h:77:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/pid_namespace.h:81:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/pid_namespace.h:86:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/pid_namespace.h:91:30: error: storage class specified for parameter 'task_active_pid_ns'
In file included from include/linux/ftrace.h:9:0,
                 from include/linux/perf_event.h:645,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/open.c:26:
include/linux/trace_clock.h:15:20: error: storage class specified for parameter 'trace_clock_local'
include/linux/trace_clock.h:15:20: error: 'no_instrument_function' attribute applies only to functions
include/linux/trace_clock.h:16:20: error: storage class specified for parameter 'trace_clock'
include/linux/trace_clock.h:16:20: error: 'no_instrument_function' attribute applies only to functions
include/linux/trace_clock.h:17:20: error: storage class specified for parameter 'trace_clock_global'
include/linux/trace_clock.h:17:20: error: 'no_instrument_function' attribute applies only to functions
include/linux/trace_clock.h:18:20: error: storage class specified for parameter 'trace_clock_counter'
include/linux/trace_clock.h:18:20: error: 'no_instrument_function' attribute applies only to functions
In file included from include/linux/ftrace.h:10:0,
                 from include/linux/perf_event.h:645,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/open.c:26:
include/linux/kallsyms.h:16:1: warning: empty declaration
include/linux/kallsyms.h:51:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:59:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:66:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:74:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:79:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:85:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:91:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:97:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
In file included from include/linux/ftrace.h:10:0,
                 from include/linux/perf_event.h:645,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/open.c:26:
include/linux/kallsyms.h:102:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:113:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:117:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:124:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
In file included from include/linux/perf_event.h:645:0,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/open.c:26:
include/linux/ftrace.h:44:1: warning: empty declaration
include/linux/ftrace.h:45:1: warning: empty declaration
include/linux/ftrace.h:224:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:227:48: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:228:38: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:229:38: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:230:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:241:1: warning: empty declaration
include/linux/ftrace.h:524:48: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:525:45: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:526:48: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:527:47: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:528:59: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:530:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:534:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:538:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:542:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:559:34: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:561:35: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:563:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:567:62: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:574:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:586:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:597:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:627:75: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:628:76: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:646:38: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:652:1: warning: empty declaration
include/linux/ftrace.h:660:1: warning: empty declaration
include/linux/ftrace.h:670:16: error: storage class specified for parameter 'trace_func_graph_ret_t'
include/linux/ftrace.h:671:15: error: storage class specified for parameter 'trace_func_graph_ent_t'
include/linux/ftrace.h:756:66: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:757:66: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:758:80: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:760:64: error: expected ')' before 'retfunc'
include/linux/ftrace.h:765:50: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:768:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:772:46: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:773:48: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
In file included from include/linux/cpu.h:17:0,
                 from include/linux/perf_event.h:646,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/open.c:26:
include/linux/node.h:21:1: warning: empty declaration
include/linux/node.h:29:1: warning: empty declaration
include/linux/node.h:30:20: error: storage class specified for parameter 'node_devices'
include/linux/node.h:31:17: error: storage class specified for parameter 'node_registration_func_t'
include/linux/node.h:33:12: error: storage class specified for parameter 'register_node'
include/linux/node.h:34:13: error: storage class specified for parameter 'unregister_node'
include/linux/node.h:51:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/node.h:55:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/node.h:59:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/node.h:63:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/node.h:68:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/node.h:73:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/node.h:77:74: error: expected ')' before 'reg'
In file included from include/linux/perf_event.h:646:0,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/open.c:26:
--
include/linux/irq.h:545:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/irq.h:550:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/irq.h:556:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/irq.h:561:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/irq.h:567:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/irq.h:591:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/irq.h:596:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/irq.h:617:1: warning: empty declaration
include/linux/irq.h:641:2: error: expected specifier-qualifier-list before 'irq_flow_handler_t'
include/linux/irq.h:638:1: warning: empty declaration
include/linux/irq.h:667:1: warning: empty declaration
include/linux/irq.h:690:1: warning: empty declaration
include/linux/irq.h:710:34: error: expected declaration specifiers or '...' before 'irq_flow_handler_t'
include/linux/irq.h:719:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/irq.h:736:61: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/irq.h:737:63: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
In file included from arch/openrisc/include/generated/asm/hardirq.h:1:0,
                 from include/linux/hardirq.h:7,
                 from include/linux/ftrace_event.h:7,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/utimes.c:10:
include/asm-generic/hardirq.h:16:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
In file included from include/linux/ftrace_event.h:7:0,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/utimes.c:10:
include/linux/hardirq.h:127:13: error: storage class specified for parameter 'synchronize_irq'
include/linux/hardirq.h:132:1: warning: empty declaration
include/linux/hardirq.h:136:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/hardirq.h:145:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/hardirq.h:149:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/hardirq.h:173:13: error: storage class specified for parameter 'irq_enter'
include/linux/hardirq.h:188:13: error: storage class specified for parameter 'irq_exit'
In file included from include/linux/ftrace_event.h:8:0,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/utimes.c:10:
include/linux/perf_event.h:28:1: warning: empty declaration
include/linux/perf_event.h:44:1: warning: empty declaration
include/linux/perf_event.h:69:1: warning: empty declaration
include/linux/perf_event.h:81:1: warning: empty declaration
include/linux/perf_event.h:89:1: warning: empty declaration
include/linux/perf_event.h:102:1: warning: empty declaration
include/linux/perf_event.h:120:1: warning: empty declaration
include/linux/perf_event.h:149:1: warning: empty declaration
include/linux/perf_event.h:170:1: warning: empty declaration
include/linux/perf_event.h:196:1: warning: empty declaration
include/linux/perf_event.h:214:1: warning: empty declaration
include/linux/perf_event.h:320:1: warning: empty declaration
include/linux/perf_event.h:327:1: warning: empty declaration
include/linux/perf_event.h:457:1: warning: empty declaration
include/linux/perf_event.h:463:1: warning: empty declaration
include/linux/perf_event.h:599:1: warning: empty declaration
include/linux/perf_event.h:626:1: warning: empty declaration
In file included from include/linux/pid_namespace.h:8:0,
                 from include/linux/perf_event.h:643,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/utimes.c:10:
include/linux/nsproxy.h:7:1: warning: empty declaration
include/linux/nsproxy.h:8:1: warning: empty declaration
include/linux/nsproxy.h:9:1: warning: empty declaration
include/linux/nsproxy.h:10:1: warning: empty declaration
include/linux/nsproxy.h:11:1: warning: empty declaration
include/linux/nsproxy.h:25:1: warning: empty declaration
include/linux/nsproxy.h:33:23: error: storage class specified for parameter 'init_nsproxy'
include/linux/nsproxy.h:61:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/nsproxy.h:71:12: error: section attribute not allowed for 'nsproxy_cache_init'
include/linux/nsproxy.h:71:1: warning: '__cold__' attribute ignored
include/linux/nsproxy.h:71:12: error: 'no_instrument_function' attribute applies only to functions
include/linux/nsproxy.h:74:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/nsproxy.h:81:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
In file included from include/linux/pid_namespace.h:9:0,
                 from include/linux/perf_event.h:643,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/utimes.c:10:
include/linux/kref.h:23:1: warning: empty declaration
include/linux/kref.h:32:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kref.h:41:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kref.h:66:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kref.h:94:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kref.h:101:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
In file included from include/linux/perf_event.h:643:0,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/utimes.c:10:
include/linux/pid_namespace.h:11:1: warning: empty declaration
include/linux/pid_namespace.h:18:1: warning: empty declaration
include/linux/pid_namespace.h:20:1: warning: empty declaration
include/linux/pid_namespace.h:39:29: error: storage class specified for parameter 'init_pid_ns'
include/linux/pid_namespace.h:64:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/pid_namespace.h:70:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/pid_namespace.h:77:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/pid_namespace.h:81:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/pid_namespace.h:86:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/pid_namespace.h:91:30: error: storage class specified for parameter 'task_active_pid_ns'
In file included from include/linux/ftrace.h:9:0,
                 from include/linux/perf_event.h:645,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/utimes.c:10:
include/linux/trace_clock.h:15:20: error: storage class specified for parameter 'trace_clock_local'
include/linux/trace_clock.h:15:20: error: 'no_instrument_function' attribute applies only to functions
include/linux/trace_clock.h:16:20: error: storage class specified for parameter 'trace_clock'
include/linux/trace_clock.h:16:20: error: 'no_instrument_function' attribute applies only to functions
include/linux/trace_clock.h:17:20: error: storage class specified for parameter 'trace_clock_global'
include/linux/trace_clock.h:17:20: error: 'no_instrument_function' attribute applies only to functions
include/linux/trace_clock.h:18:20: error: storage class specified for parameter 'trace_clock_counter'
include/linux/trace_clock.h:18:20: error: 'no_instrument_function' attribute applies only to functions
In file included from include/linux/ftrace.h:10:0,
                 from include/linux/perf_event.h:645,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/utimes.c:10:
include/linux/kallsyms.h:16:1: warning: empty declaration
include/linux/kallsyms.h:51:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:59:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:66:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:74:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:79:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:85:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:91:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:97:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
In file included from include/linux/ftrace.h:10:0,
                 from include/linux/perf_event.h:645,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/utimes.c:10:
include/linux/kallsyms.h:102:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:113:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:117:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/kallsyms.h:124:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
In file included from include/linux/ftrace.h:13:0,
                 from include/linux/perf_event.h:645,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/utimes.c:10:
include/linux/ptrace.h:117:13: error: storage class specified for parameter 'arch_ptrace'
include/linux/ptrace.h:119:12: error: storage class specified for parameter 'ptrace_readdata'
include/linux/ptrace.h:120:12: error: storage class specified for parameter 'ptrace_writedata'
include/linux/ptrace.h:121:13: error: storage class specified for parameter 'ptrace_disable'
include/linux/ptrace.h:122:12: error: storage class specified for parameter 'ptrace_check_attach'
include/linux/ptrace.h:123:12: error: storage class specified for parameter 'ptrace_request'
include/linux/ptrace.h:125:13: error: storage class specified for parameter 'ptrace_notify'
include/linux/ptrace.h:126:13: error: storage class specified for parameter '__ptrace_link'
include/linux/ptrace.h:128:13: error: storage class specified for parameter '__ptrace_unlink'
include/linux/ptrace.h:129:13: error: storage class specified for parameter 'exit_ptrace'
include/linux/ptrace.h:134:13: error: storage class specified for parameter 'ptrace_may_access'
include/linux/ptrace.h:137:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ptrace.h:142:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ptrace.h:164:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ptrace.h:180:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ptrace.h:195:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ptrace.h:217:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ptrace.h:247:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ptrace.h:307:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ptrace.h:321:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ptrace.h:350:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ptrace.h:363:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ptrace.h:404:12: error: storage class specified for parameter 'task_current_syscall'
include/linux/ptrace.h:412:68: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
In file included from include/linux/perf_event.h:645:0,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from fs/utimes.c:10:
include/linux/ftrace.h:44:1: warning: empty declaration
include/linux/ftrace.h:45:1: warning: empty declaration
include/linux/ftrace.h:224:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:227:48: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:228:38: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:229:38: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:230:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:241:1: warning: empty declaration
include/linux/ftrace.h:524:48: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:525:45: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:526:48: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:527:47: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:528:59: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:530:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:534:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:538:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:542:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:559:34: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:561:35: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:563:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:567:62: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:574:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:586:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:597:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:627:75: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:628:76: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:646:38: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:652:1: warning: empty declaration
include/linux/ftrace.h:660:1: warning: empty declaration
include/linux/ftrace.h:670:16: error: storage class specified for parameter 'trace_func_graph_ret_t'
include/linux/ftrace.h:671:15: error: storage class specified for parameter 'trace_func_graph_ent_t'
include/linux/ftrace.h:756:66: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/ftrace.h:757:66: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
..

vim +17 include/linux/projid.h

f76d207a (Eric W. Biederman 2012-08-30   1) #ifndef _LINUX_PROJID_H
f76d207a (Eric W. Biederman 2012-08-30   2) #define _LINUX_PROJID_H
f76d207a (Eric W. Biederman 2012-08-30   3) 
f76d207a (Eric W. Biederman 2012-08-30   4) /*
f76d207a (Eric W. Biederman 2012-08-30   5)  * A set of types for the internal kernel types representing project ids.
f76d207a (Eric W. Biederman 2012-08-30   6)  *
f76d207a (Eric W. Biederman 2012-08-30   7)  * The types defined in this header allow distinguishing which project ids in
f76d207a (Eric W. Biederman 2012-08-30   8)  * the kernel are values used by userspace and which project id values are
f76d207a (Eric W. Biederman 2012-08-30   9)  * the internal kernel values.  With the addition of user namespaces the values
f76d207a (Eric W. Biederman 2012-08-30  10)  * can be different.  Using the type system makes it possible for the compiler
f76d207a (Eric W. Biederman 2012-08-30  11)  * to detect when we overlook these differences.
f76d207a (Eric W. Biederman 2012-08-30  12)  *
f76d207a (Eric W. Biederman 2012-08-30  13)  */
f76d207a (Eric W. Biederman 2012-08-30  14) #include <linux/types.h>
f76d207a (Eric W. Biederman 2012-08-30  15) 
f76d207a (Eric W. Biederman 2012-08-30  16) struct user_namespace;
f76d207a (Eric W. Biederman 2012-08-30 @17) extern struct user_namespace init_user_ns;
f76d207a (Eric W. Biederman 2012-08-30  18) 
f76d207a (Eric W. Biederman 2012-08-30  19) typedef __kernel_uid32_t projid_t;
f76d207a (Eric W. Biederman 2012-08-30  20) 
f76d207a (Eric W. Biederman 2012-08-30  21) #ifdef CONFIG_UIDGID_STRICT_TYPE_CHECKS
f76d207a (Eric W. Biederman 2012-08-30  22) 
f76d207a (Eric W. Biederman 2012-08-30  23) typedef struct {
f76d207a (Eric W. Biederman 2012-08-30  24) 	projid_t val;
f76d207a (Eric W. Biederman 2012-08-30  25) } kprojid_t;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
