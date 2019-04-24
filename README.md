# metricKeywordExtension

Writing good code is a hard job. Sometimes you are in a rush, that you forget to split large source code files or edit the same files on and on and on, because of errors.

This this scripts the developer get some metric data that should remind him to write good code.

Based on the Book [Software Design X-Rays](https://pragprog.com/book/atevol/software-design-x-rays) here are some scripts to weave some metric data into the source code files, so that the developer can decide to write better code.

## Getting Started

### Prerequisites

Followwing software should be installed:
* Git
* Python is optional

### Installing

Clone this reprositry and make the scripts in the main directory accessible from everywhere.
Extend the `PATH`-Variable or copy the scripts into a `PATH`-directory.

Edit the configuration file `metricBreakPoints.sh` and set up your repository (have look at Configuration) or replace the file with the sample-file from the `example` directory.

### Quick-Start

Insert following lines as comments into a file in your git-repository (Example in Java):

<pre><code>
  /*    # Complexity : # */<br>
  /*    # LineDiff   : # */<br>
  /*    # Loc        : # */<br>
  /*    # Commits    : # */<br>
  /*    # tech. Debt : # */<br>
</code></pre>

In a Unix-Shell start `metricUpdate.sh` in a Powershell start `metricUpdate.ps1`.

Open the file again and the new lines have changed like this:

<pre><code>
  /*    # Complexity :    780 < 1600 # */<br>
  /*    # LineDiff   :    211 <  370 # */<br>
  /*    # Loc        : ! 1081 > 1000 # */<br>
  /*    # Commits    : !  132 >  100 # */<br>
  /*    # tech. Debt : !    2 # */<br>
</code></pre>

### Interpretation

Each line show you a different metric. On the right side there are the breakpoints from your configuration file `metricBreakPoints.sh`. On the left side there are the values from the current source code file. This value should be lower then the breakpoints to keep the source file healthy.
If the values are greater than the breakpoints, that will be shown with a exclamation mark and the technical Debt index raises.

The `tech. Debt` line shows how good and healthy your source code file is compared to the rest. Keep this value near to zero :-).

###  Configuration

<ToDo>

## Running the tests

<ToDo>


## Authors

* **Markus Wessjohann** - *Initial work* - [MarkusWessjohann](https://github.com/MarkusWessjohann)

See also the list of [contributors](https://github.com/MarkusWessjohann/metricKeywordExtension/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Adam Tornhill for writing [Your Code as a Crime Scene](https://pragprog.com/book/atcrime/your-code-as-a-crime-scene) and
[Software Design X-Rays](https://pragprog.com/book/atevol/software-design-x-rays).


