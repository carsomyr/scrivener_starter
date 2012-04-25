# Scrivener Starter Repository

[Scrivener](http://www.literatureandlatte.com/scrivener.php) is a writing
application geared toward structuring and editing novel- and thesis-sized works.
It is mainly used by writers and academics to organize works that would
otherwise be unwieldy in a linear editor.

Scrivener projects are layed out as application bundles with the .scriv
extension, and, as it turns out, are amenable to Git version control: That is to
say, Scrivener stores internal textual assets as separate files in ASCII-encoded
RTF format. If you would like to use Git to track Scrivener changes, you are
welcome to bootstrap off of the included `starter.scriv` project. It has the
benefit of strategically placed .gitignore files to prevent transient metadata
from cluttering your `git status` view and being incorporated into revision
history.

The following workflow will send you on your way.

1. Rename the `starter.scriv` project, open with Scrivener, and save. Stage and
   commit the changes.

        $ # Rename the project.
        $ git mv -- starter.scriv ${project}.scriv
        $ git mv -- ${project}.scriv/starter.scrivx \
          ${project}.scriv/${project}.scrivx

        $ # Open with Scrivener and save.
        $ open -- ${project}.scriv

        $ git add -u
        $ git commit -m "Rename the project"

2. Write some stuff, save, and check for untracked textual assets. Stage and
   commit the changes. Repeat this step as you continue to make revisions.

        $ # Open with Scrivener, write some stuff, and save.
        $ open -- ${project}.scriv

        $ # Check for untracked textual assets and stage them.
        $ git add -- ${project}.scriv/Files/Docs/${n}.rtf

        $ git add -u
        $ git commit -m "Make changes"

### License

    Copyright 2012 Roy Liu

    Licensed under the Apache License, Version 2.0 (the "License"); you may not
    use this file except in compliance with the License. You may obtain a copy
    of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
    License for the specific language governing permissions and limitations
    under the License.
