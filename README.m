PHASE 0 — PREPARATION (MINDSET + SKILLS)
0.1 — Learn these fundamentals first
✔ OS threads
✔ Processes
✔ Virtual memory
✔ Scheduling
✔ Context switching
✔ Syscalls (read, write, sleep)
✔ Locks and atomic operations
✔ Stacks vs heap
✔ CPU cores vs logical threads
This knowledge is needed because Go runtime is built on top of these concepts.

PHASE 1 — FOUNDATION: CLI Skeleton (No concurrency yet)
TASK 1.1 — Create a command-line interface
Accept arguments
Display help
Allow runtime refresh (like top)
Clear terminal screen each cycle

WHAT YOU LEARN
✔ CLI rendering
✔ Refresh loop
✔ High-level structure of system tools

🟧 PHASE 2 — GOROUTINE CREATION + BEHAVIOR BASICS
TASK 2.1 — Create simple goroutines

G1 loops CPU work

G2 loops IO sleep

G3 mixes both

WHY

To study how Go scheduler treats:

CPU-bound goroutines

IO-blocked goroutines

mixed workloads

YOU LEARN

✔ G state transitions
✔ Runnable → Running → Waiting
✔ How Go parks/unparks goroutines

TASK 2.2 — Measure goroutine count

Display runtime.NumGoroutine()

Track when count increases

Track when goroutines exit

WHAT YOU LEARN

✔ Lifecycle of G
✔ Goroutine leak detection
✔ Blocking behavior

🟨 PHASE 3 — ARCHITECTURE DEEP DIVE: GMP MODEL
TASK 3.1 — Display CPU cores + GOMAXPROCS

Number of CPUs

How many P’s (Processors)

How many M’s (OS threads)

YOU LEARN

✔ How Go turns OS cores → scheduler units
✔ How GOMAXPROCS affects scheduling

TASK 3.2 — Simulate load on each P

Create multiple goroutine groups

Pin workloads on different P’s (implicitly)

Observe who gets stolen

Observe M creation

YOU LEARN

✔ Work stealing
✔ Per-P local run queues
✔ Global run queue
✔ Handoff between M’s

🟩 PHASE 4 — MEMORY INTERNALS
TASK 4.1 — Read MemStats in your CLI

Display:

HeapAlloc

StackInuse

Malloc count

GC cycles

Pause times

YOU LEARN

✔ Heap vs stack understanding
✔ GC triggers
✔ Growth patterns

TASK 4.2 — Track stack addresses

Use runtime.Stack() to dump:

Stack base address

Stack size

Function call frames

YOU LEARN

✔ How Go allocates 2KB initial stack
✔ How stack grows
✔ How splitting works (stack growth)
✔ Stack frames (PC, SP, FP)

TASK 4.3 — Trigger stack growth intentionally

Create goroutines with deep recursion.

Observe:

Stack jumps

GC scanning changes

Memory usage grows

🟫 PHASE 5 — GO SCHEDULER INTERNALS
TASK 5.1 — Track goroutine states

Parse stack dump:

You must show:

State	Meaning
running	executing on an M
runnable	in P queue
syscall	blocked in OS syscall
sleep	timer-based block
waiting	channel or lock
GC assist	helping GC
WHAT YOU LEARN

✔ Full Go scheduler lifecycle
✔ Channel blocking
✔ Syscall blocking
✔ Sleep-based parking
✔ GC assist phase

TASK 5.2 — Simulate different block types

Create goroutines that block on:

channel receive

channel send

mutex lock

RW lock

time.Sleep

syscall (file read)

Then inspect how runtime represents each state.

🟪 PHASE 6 — CHANNEL & SYNC DEEP DIVE
TASK 6.1 — Channel introspection

Build workloads that illustrate:

buffered channels

unbuffered channels

fan-in

fan-out

pipeline concurrency

WHY

So you can see blocking behavior in your CLI.

TASK 6.2 — Measure contention

Use mutexes and see how:

goroutines wait

scheduler parks them

queues grow

YOU LEARN

✔ Lock ordering
✔ Starvation
✔ Mutex slow paths

🟥 PHASE 7 — RUNTIME PROFILING
TASK 7.1 — Add internal profiler triggers

Expose:

CPU profile

Memory profile

Block profile

Mutex profile

Learn:
✔ Why profiling pauses goroutines
✔ Why CPU profiler only samples running goroutines
✔ Why blocking profiler shows waiting G

🟦 PHASE 8 — OS-LEVEL VIEW
TASK 8.1 — Inspect OS threads created by Go

Track:

How many M’s created

How many threads blocked

Relationship G → M → P

YOU LEARN

✔ Difference between Go’s “green threads” and OS threads
✔ When Go adds extra threads
✔ How Go deals with syscalls

🟧 PHASE 9 — GC INTERNALS
TASK 9.1 — Track GC cycles

Print every GC event:

Start time

End time

Pause time

Assist count

TASK 9.2 — Trigger GC manually

Force collections and observe:

Goroutine pause

Stop-the-world

Stack scanning

Heap marking

🟨 PHASE 10 — FINAL ADVANCED TOPICS
Add in-depth modules:

✔ Deadlock detection
✔ Starvation detection
✔ Scheduler fairness testing
✔ Memory fragmentation visualization
✔ Stack trace sampling
✔ Simulated thread pinning
✔ NUMA awareness (advanced OS topic)
✔ Preemption tracing